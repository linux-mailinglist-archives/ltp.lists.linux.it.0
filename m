Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7826B36190D
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 07:00:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F6403C1ADC
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 07:00:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 469423C1ABA
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 07:00:33 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4365E1400B74
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 07:00:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618549229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lZciyOXN4nbx4LjNcGSlGvmcKnnQswF3/o8P8j9vfTk=;
 b=evfvxGW8YxBVt4qnt4MGqKyVXh8NcPCko8ihsbTMWsNisQ/CoV1PYnY9Ub+sBkXct3nnaG
 qcyj1ZDa/2YUcZRIJn6DzGOcWBhMW8MCp+D0ANkj2QKXSQ9Es5K3G4ML6/M87PTOk01VaU
 nakT5RfyD1exQdlSxailWSodbcFdHOw=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-yJrqAk4zMSWO-al3T21nog-1; Fri, 16 Apr 2021 01:00:26 -0400
X-MC-Unique: yJrqAk4zMSWO-al3T21nog-1
Received: by mail-yb1-f199.google.com with SMTP id u128so4841072ybf.12
 for <ltp@lists.linux.it>; Thu, 15 Apr 2021 22:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lZciyOXN4nbx4LjNcGSlGvmcKnnQswF3/o8P8j9vfTk=;
 b=D0GrNQIj4SIeJJejNtV6emkkbvhd9T5av1nlk/vb6EuRdF5CbDcHr2vN0U4Ha7R67u
 3GA9JFZJruYP+lBf9dj77InMofXC9bExs03BQ4awFBJe3jjKaJkiwdB4osS2ku8tvmLg
 PV+25tPVvxJpwIc6ImuugXEd4cm5Z9j0lj0j2C1UvUTkWj2VXoF9R23pRdvP1Tal0aqe
 RkJ6B3NC+HavcYqR+yQRXiFp/lyHsPQrqYnm1DlXD9bLtgCKg2njSjzXqUErB4YWQqqT
 L4Iiq3iEqSl7oIoAm4wAtAWMEunBLjOTiO3QKGTsGkmYDxMQnX9B4HMZlKNPxXURmEsk
 PpDA==
X-Gm-Message-State: AOAM533K/+RW+szPGWaUTQJnKJqkyq6TFUrkf52vND1sfJiGuuMdwOrC
 RDLfc3CSGHztIBj4JKBbJJCJ4v83ODwYNWZxVF0bQfx2vgpwnkYBrfRXkVf60W+03QTxFcI6ALc
 b7cPbeZUUcANYc78SlOqpI5Bmt8Y=
X-Received: by 2002:a25:d802:: with SMTP id p2mr9162852ybg.97.1618549225530;
 Thu, 15 Apr 2021 22:00:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhJ4mxqwbMnQW04+QQvGJ0XiAtJ7GwgkQuOycUfc8OXhzsK2znTRV4A9eccNB1MePyISy0a6rWzx1JkWTPC88=
X-Received: by 2002:a25:d802:: with SMTP id p2mr9162828ybg.97.1618549225258;
 Thu, 15 Apr 2021 22:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210412145506.26894-1-rpalethorpe@suse.com>
 <20210412145506.26894-4-rpalethorpe@suse.com>
 <YHcMnBaznFaBPj2U@yuki> <875z0n3d93.fsf@suse.de>
In-Reply-To: <875z0n3d93.fsf@suse.de>
From: Li Wang <liwang@redhat.com>
Date: Fri, 16 Apr 2021 13:00:13 +0800
Message-ID: <CAEemH2fWB7KcXbT-4OVE7WfCfkVA2_k9-dW+CXTKgh5aTtETFQ@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/7] Add new CGroups APIs
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0982932190=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0982932190==
Content-Type: multipart/alternative; boundary="0000000000009f99c305c00fdbe4"

--0000000000009f99c305c00fdbe4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

>> -enum tst_cgroup_ctrl {
> >> -    TST_CGROUP_MEMCG =3D 1,
> >> +/* Controller sub-systems */
> >> +enum tst_cgroup_css {
> >> +    TST_CGROUP_MEMORY =3D 1,
> >>      TST_CGROUP_CPUSET =3D 2,
> >> -    /* add cgroup controller */
> >>  };
> >
> > I spend a bit of time figuring out what css means, can't we just use
> > controler in the code instead? It's a bit longer but more obvious.
> >
> > Or is this consitent with kernel naming?
>
> The kernel seems to refer to controllers as subsystems and css appears
> to mean "CGroup subsystem". I'm not sure if subsystems are necessarily
> controllers, but it seems that way. Also "controller" has too many
> letters in it. Indeed it makes some function names very long and I found
> that harder to read.


I also feel css looks oddly, if "controller" is too long we can go back
with "ctrl",
then we might need a one-line comment for the name abbreviation.

e.g.  previous "/* add cgroup controller */" is make no sense but a hint
for people
to know this is cgroup controller and could be extended in the future.


> I suppose to be totally consistent with the kernel we should randomly
> name some things css and others subsys. :-p
>

Not very necessary, this test API is facing for userland,
understanding easily
for users is more important I think.


>> +struct tst_cgroup_opts {
> >> +    /* Only try to mount V1 CGroup controllers. This will not
> >> +     * prevent V2 from being used if it is already mounted, it
> >> +     * only indicates that we should mount V1 controllers if
> >> +     * nothing is present. By default we try to mount V2 first. */
> >> +    int only_mount_v1:1;
> >> +};
> >
> > Do we need to pass the flags in a structure?
> >
> > This is not an API that has to be future proof, when we find out we nee=
d
> > more than a few bitflags we can always change it.
>
> We may need to add xattr to this and there are many other
> options. However most tests will just have NULL or 0, 0... So we could
> move it into a vararg or have a tst_require2?
>

My 2cent:

I slightly think tst_cgroup_opts is good stuff, it gives a possibility
to let users hook the cgoup mount way or, more options they
needed (maybe for customized users). And, in most situations
that test just has NULL, that's fine.

@Richard,
do you want to reserve the =E2=80=98no_cleanup=E2=80=98 in this structure a=
s well?
I noticed you leave it in tst_cgroup02 test.



> >> +    struct tst_cgroup_tree *trees[TST_CGROUP_MAX_TREES + 1];
> >> +};
> >
> > So this is an array of directories in different trees, can we please
> > name the strucuture better. What about tst_cgroup_nodes or
> > tst_cgroup_dirs?
>
> I guess tst_cgroup_tree always represents a directory. So I would go
> with tst_cgroup_dir.
>

+1

>> +struct tst_cgroup_tree {
> >
> > Why isn't this called node or dir? Either of these would be more
> > fitting.
> >
> > Also the tst_cgroup structure could use a better name, the tst_cgroup i=
s
> > actually an array of pointers to directories.
>
> As far as the test author is concerned it represents an actual "Control
> Group". We keep arrays of directories to join together multiple V1
> controllers on different hierarchies, but that is an implementation
> detail.
>
> If anything it should be called tst_cgroup_group, but I don't like the
> repetition. :-p
>

Personally, I think tst_cgroup_node may be better since we have described
a tree for cgroup.  root, node, and leaves(files) should be more vivid.


>> +
> >> +    /* In general we avoid having sprintfs everywhere and use
> >> +     * openat, linkat, etc.
> >> +     */
> >> +    int dir;
> >
> > Can we name this dir_fd so it's obvious what it is?
>

+1
I stand by Cyril at this point.


>> +/* Lookup tree for item names. */
> >> +typedef struct cgroup_item items_t[];
> >> +static items_t items =3D {
> >> +    [0] =3D { "cgroup", .inner =3D (items_t){
> >> +                    { "cgroup.procs", "tasks" },
> >> +                    { "cgroup.subtree_control" },
> >> +                    { "cgroup.clone_children", "clone_children" },
> >> +                    { NULL }
> >>              }
> >> -    }
> >> -    SAFE_FCLOSE(file);
> >> +    },
> >> +    [TST_CGROUP_MEMORY] =3D { "memory", .inner =3D (items_t){
> >> +                    { "memory.current", "memory.usage_in_bytes" },
> >> +                    { "memory.max", "memory.limit_in_bytes" },
> >> +                    { "memory.swappiness", "memory.swappiness" },
> >> +                    { "memory.swap.current",
> "memory.memsw.usage_in_bytes" },
> >> +                    { "memory.swap.max", "memory.memsw.limit_in_bytes=
"
> },
> >> +                    { "memory.kmem.usage_in_bytes",
> "memory.kmem.usage_in_bytes" },
> >> +                    { "memory.kmem.limit_in_bytes",
> "memory.kmem.usage_in_bytes" },
> >> +                    { NULL }
> >> +            },
> >> +      .css_indx =3D TST_CGROUP_MEMORY
> >> +    },
> >> +    [TST_CGROUP_CPUSET] =3D { "cpuset", .inner =3D (items_t){
> >> +                    { "cpuset.cpus", "cpuset.cpus" },
> >> +                    { "cpuset.mems", "cpuset.mems" },
> >> +                    { "cpuset.memory_migrate", "cpuset.memory_migrate=
"
> },
> >> +                    { NULL }
> >> +            },
> >> +      .css_indx =3D TST_CGROUP_CPUSET
> >> +    },
> >> +    { NULL }
> >> +};
> >
> > Item is a very generic word, this is a list of known knobs and map
> > between v1 and v2. So maybe cgroup_knob_map or just cgroup_knobs ?
>
> I suppose that cgroup_item can be seperated into just two structs now
> that I removed controller sub items like "memory.swap". This might help
> solve the missing initializer warnings as well.


To separate into two structs sounds good, the 'cgroup_item' contains both
trunk node and controller files make things mess up.


> I would not describe "memory.current" as a knob. It is a read only file
> and I think of knobs as something you can write to. So I would prefer
> cgroup_file and cgroup_subsys.


+1
cgroup_file and cgroup_subsys(or cgroup_controller) all very nice.

--=20
Regards,
Li Wang

--0000000000009f99c305c00fdbe4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi,</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
&gt;&gt; -enum tst_cgroup_ctrl {<br>
&gt;&gt; -=C2=A0 =C2=A0 TST_CGROUP_MEMCG =3D 1,<br>
&gt;&gt; +/* Controller sub-systems */<br>
&gt;&gt; +enum tst_cgroup_css {<br>
&gt;&gt; +=C2=A0 =C2=A0 TST_CGROUP_MEMORY =3D 1,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 TST_CGROUP_CPUSET =3D 2,<br>
&gt;&gt; -=C2=A0 =C2=A0 /* add cgroup controller */<br>
&gt;&gt;=C2=A0 };<br>
&gt;<br>
&gt; I spend a bit of time figuring out what css means, can&#39;t we just u=
se<br>
&gt; controler in the code instead? It&#39;s a bit longer but more obvious.=
<br>
&gt;<br>
&gt; Or is this consitent with kernel naming?<br>
<br>
The kernel seems to refer to controllers as subsystems and css appears<br>
to mean &quot;CGroup subsystem&quot;. I&#39;m not sure if subsystems are ne=
cessarily<br>
controllers, but it seems that way. Also &quot;controller&quot; has too man=
y<br>
letters in it. Indeed it makes some function names very long and I found<br=
>
that harder to read.</blockquote><div><br></div><div><div class=3D"gmail_de=
fault" style=3D"font-size:small">I also feel css looks oddly, if &quot;cont=
roller&quot; is too long we can go back with &quot;ctrl&quot;,</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">then we might need a one-li=
ne comment for the name abbreviation.</div></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><br></div><div><div class=3D"gmail_default" st=
yle=3D"font-size:small">e.g.=C2=A0 previous &quot;/* add cgroup controller =
*/&quot;=C2=A0is make no sense but a hint for people</div><div class=3D"gma=
il_default" style=3D"font-size:small">to know this is cgroup controller and=
 could be extended in the future.</div></div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
I suppose to be totally consistent with the kernel we should randomly<br>
name some things css and others subsys. :-p<br></blockquote><div><br></div>=
<div><div class=3D"gmail_default" style=3D"font-size:small">Not very necess=
ary, this test API is facing for userland, understanding=C2=A0easily</div><=
div class=3D"gmail_default" style=3D"font-size:small">for users is more imp=
ortant I think.</div></div><div>=C2=A0</div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
&gt;&gt; +struct tst_cgroup_opts {<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Only try to mount V1 CGroup controllers. This wi=
ll not<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* prevent V2 from being used if it is already=
 mounted, it<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* only indicates that we should mount V1 cont=
rollers if<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* nothing is present. By default we try to mo=
unt V2 first. */<br>
&gt;&gt; +=C2=A0 =C2=A0 int only_mount_v1:1;<br>
&gt;&gt; +};<br>
&gt;<br>
&gt; Do we need to pass the flags in a structure?<br>
&gt;<br>
&gt; This is not an API that has to be future proof, when we find out we ne=
ed<br>
&gt; more than a few bitflags we can always change it.<br>
<br>
We may need to add xattr to this and there are many other<br>
options. However most tests will just have NULL or 0, 0... So we could<br>
move it into a vararg or have a tst_require2?<br></blockquote><div><br></di=
v><div><div class=3D"gmail_default" style=3D"font-size:small">My 2cent:=C2=
=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">I slightly think tst_=
cgroup_opts is good stuff, it gives a possibility</div><div class=3D"gmail_=
default" style=3D"font-size:small">to let users hook the cgoup=C2=A0mount w=
ay or, more options they</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">needed (maybe for customized users). And, in=C2=A0most situations=
</div><div class=3D"gmail_default" style=3D"font-size:small">that test just=
 has NULL, that&#39;s fine.</div><br></div><div><div class=3D"gmail_default=
" style=3D"font-size:small">@Richard,</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">do you want to reserve the =E2=80=98no_cleanup=E2=80=
=98 in this structure as well?</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">I noticed you leave it in tst_cgroup02 test.</div><br></div=
><div>=C2=A0=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;&gt; +=C2=A0 =C2=A0 struct tst_cgroup_tree *trees[TST_CGROUP_MAX_TREES =
+ 1];<br>
&gt;&gt; +};<br>
&gt;<br>
&gt; So this is an array of directories in different trees, can we please<b=
r>
&gt; name the strucuture better. What about tst_cgroup_nodes or<br>
&gt; tst_cgroup_dirs?<br>
<br>
I guess tst_cgroup_tree always represents a directory. So I would go<br>
with tst_cgroup_dir.<br></blockquote><div><br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">+1</div><div class=3D"gmail_default" style=
=3D"font-size:small"></div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;&gt; +struct tst_cgroup_tree {<br>
&gt;<br>
&gt; Why isn&#39;t this called node or dir? Either of these would be more<b=
r>
&gt; fitting.<br>
&gt;<br>
&gt; Also the tst_cgroup structure could use a better name, the tst_cgroup =
is<br>
&gt; actually an array of pointers to directories.<br>
<br>
As far as the test author is concerned it represents an actual &quot;Contro=
l<br>
Group&quot;. We keep arrays of directories to join together multiple V1<br>
controllers on different hierarchies, but that is an implementation<br>
detail.<br>
<br>
If anything it should be called tst_cgroup_group, but I don&#39;t like the<=
br>
repetition. :-p<br></blockquote><div><br></div><div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Personally, I think tst_cgroup_node may be =
better since we have described</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">a tree for cgroup.=C2=A0 root, node, and leaves(files) shou=
ld be more vivid.</div><br></div><div><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /* In general we avoid having sprintfs everywhere a=
nd use<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* openat, linkat, etc.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; +=C2=A0 =C2=A0 int dir;<br>
&gt;<br>
&gt; Can we name this dir_fd so it&#39;s obvious what it is?<br></blockquot=
e><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small=
">+1</div><div class=3D"gmail_default" style=3D"font-size:small">I stand by=
 Cyril at this point.</div></div><div>=C2=A0</div><div><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
&gt;&gt; +/* Lookup tree for item names. */<br>
&gt;&gt; +typedef struct cgroup_item items_t[];<br>
&gt;&gt; +static items_t items =3D {<br>
&gt;&gt; +=C2=A0 =C2=A0 [0] =3D { &quot;cgroup&quot;, .inner =3D (items_t){=
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 { &quot;cgroup.procs&quot;, &quot;tasks&quot; },<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 { &quot;cgroup.subtree_control&quot; },<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 { &quot;cgroup.clone_children&quot;, &quot;clone_children&quot; },<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 { NULL }<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; -=C2=A0 =C2=A0 }<br>
&gt;&gt; -=C2=A0 =C2=A0 SAFE_FCLOSE(file);<br>
&gt;&gt; +=C2=A0 =C2=A0 },<br>
&gt;&gt; +=C2=A0 =C2=A0 [TST_CGROUP_MEMORY] =3D { &quot;memory&quot;, .inne=
r =3D (items_t){<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 { &quot;memory.current&quot;, &quot;memory.usage_in_bytes&quot; },<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 { &quot;memory.max&quot;, &quot;memory.limit_in_bytes&quot; },<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 { &quot;memory.swappiness&quot;, &quot;memory.swappiness&quot; },<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 { &quot;memory.swap.current&quot;, &quot;memory.memsw.usage_in_bytes=
&quot; },<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 { &quot;memory.swap.max&quot;, &quot;memory.memsw.limit_in_bytes&quo=
t; },<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 { &quot;memory.kmem.usage_in_bytes&quot;, &quot;memory.kmem.usage_in=
_bytes&quot; },<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 { &quot;memory.kmem.limit_in_bytes&quot;, &quot;memory.kmem.usage_in=
_bytes&quot; },<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 { NULL }<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .css_indx =3D TST_CGROUP_MEMORY<br>
&gt;&gt; +=C2=A0 =C2=A0 },<br>
&gt;&gt; +=C2=A0 =C2=A0 [TST_CGROUP_CPUSET] =3D { &quot;cpuset&quot;, .inne=
r =3D (items_t){<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 { &quot;cpuset.cpus&quot;, &quot;cpuset.cpus&quot; },<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 { &quot;cpuset.mems&quot;, &quot;cpuset.mems&quot; },<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 { &quot;cpuset.memory_migrate&quot;, &quot;cpuset.memory_migrate&quo=
t; },<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 { NULL }<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .css_indx =3D TST_CGROUP_CPUSET<br>
&gt;&gt; +=C2=A0 =C2=A0 },<br>
&gt;&gt; +=C2=A0 =C2=A0 { NULL }<br>
&gt;&gt; +};<br>
&gt;<br>
&gt; Item is a very generic word, this is a list of known knobs and map<br>
&gt; between v1 and v2. So maybe cgroup_knob_map or just cgroup_knobs ?<br>
<br>
I suppose that cgroup_item can be seperated into just two structs now<br>
that I removed controller sub items like &quot;memory.swap&quot;. This migh=
t help<br>
solve the missing initializer warnings as well.=C2=A0</blockquote><div><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">To separate in=
to two structs sounds good, the &#39;cgroup_item&#39; contains both</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">trunk node and control=
ler files make things mess up.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall"></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I would not describe &quot;memory.current&quot; as a knob. It is a read onl=
y file<br>
and I think of knobs as something you can write to. So I would prefer<br>
cgroup_file and cgroup_subsys.</blockquote><div>=C2=A0</div><div><div class=
=3D"gmail_default" style=3D"font-size:small">+1</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">cgroup_file and cgroup_subsys(or cgroup_co=
ntroller) all very nice.</div></div><div>=C2=A0</div></div>-- <br><div dir=
=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></di=
v></div></div>

--0000000000009f99c305c00fdbe4--


--===============0982932190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0982932190==--

