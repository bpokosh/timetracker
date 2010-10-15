pdf.text "Time Log for #{@project.customer.company}", :size => 16, :style => :bold
pdf.text "Project - #{@project.name}", :size => 16, :style => :bold

pdf.move_down 10

if @project.time_entries.size > 0
  entries = @project.time_entries.collect do |entry|
    [
        entry.project.name,
        entry.completed_at.try(:to_s, :long),
        format_time(entry.duration),
        entry.description
    ]
  end

  pdf.table entries, :border_style => :grid,  
                     :row_colors => ["FFFFFF", "DDDDDD"],  
                     :headers => ["Project", "Completed At", "Duration", "Description"],  
                     :align => { 0 => :left, 1 => :right, 2 => :right, 3 => :right }
end
