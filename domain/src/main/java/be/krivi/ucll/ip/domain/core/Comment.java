package be.krivi.ucll.ip.domain.core;

import be.krivi.ucll.ip.domain.common.Entity;
import be.krivi.ucll.ip.domain.exception.DomainException;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.Table;
import javax.validation.constraints.Size;

/**
 * Created by Krivi on 16/02/16.
 */
@javax.persistence.Entity
@Table( name = "comment" )
public class Comment extends Entity{

    @NotEmpty( message = "{NotEmpty.Comment.comment}" )
    @Size( min = 2, max = 140, message = "{Size.Comment.comment}" )
    private String comment;

    public Comment(){
    }

    public Comment( String comment ) throws DomainException{
        setComment( comment );
    }

    public String getComment(){
        return comment;
    }

    public void setComment( String comment ){
        this.comment = comment;
    }
}
