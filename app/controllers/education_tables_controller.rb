class EducationTablesController < RtablesController
  def rtable_params
    params.require(:education_table).permit(:id, :columns, :positions, :title)
  end
end
