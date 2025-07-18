

    select *
    from "casestudy"."marts"."marts__loans_enriched"
    where approval_rejection_date > current_date()
    
