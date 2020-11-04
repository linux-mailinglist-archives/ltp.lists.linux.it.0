Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9F92A6058
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 10:12:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E29293C2FFF
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 10:12:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 0575F3C2FED
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 10:12:28 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 6BAA5600078
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 10:12:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604481146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nCesjZSceYciuvF0ckatJxbF5Rr+FOzMC4COTeEzCj0=;
 b=VsBTpkWBsTVO0JvSoJ8fqg/gYdx4unhenmLYcxYUQTBithASijTDZo6Fq4w0B+NBgT+MEf
 oTlX5aG6g3zMPLobTZCYQ7gl4qaxi/6RNyRQoOiU2MJH6AiIoZGn7WDmEXbIKp8I5L7Vgv
 u9G4c656WGYkcHrLAAMIqrbQW+57o2w=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-kdP2lyHiOlWmPOQf6EswVQ-1; Wed, 04 Nov 2020 04:12:22 -0500
X-MC-Unique: kdP2lyHiOlWmPOQf6EswVQ-1
Received: by mail-yb1-f198.google.com with SMTP id c9so21072292ybs.8
 for <ltp@lists.linux.it>; Wed, 04 Nov 2020 01:12:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nCesjZSceYciuvF0ckatJxbF5Rr+FOzMC4COTeEzCj0=;
 b=d7DNJ4uSaT/nZqaGLOKXUqACarK1ZqlY246y38beN87AdwUPFYW43Mq7GbZ1vGWSF7
 GA8i7mYv0IbcEz8o2uo7jwc6k8wqW0Lhh6aKi9ChOauiEuoYzilviSfcNrmUiW7NnjDg
 XW4Qr9ndzR3ssr3EtBSRJdvI6ITQv0e6KqSVpvYi0yQujEAd4ZAlp5A9x888DiRDuQWw
 TSF2F0YieFVbIQS9eZs9xIPlQVuDlxQZFo2iS9xe0SW33roaAy0apLWhWzEvWqroio3e
 kYfRzr3KoAzwWdz5897QBCFb46UNRhtc80qsalRUNRci+3nGeZH5B3EnXHZhsBrp3v+/
 Q0JA==
X-Gm-Message-State: AOAM531x9SI3Kyvn5WGhq9wupUqpsCKhT7JuCo5L3LeIXxZdIIFnaVhE
 1TwivqPWPCGwsr6nPmG5P6jVUVJRsnrsm9zYIvwMWwfIs8pmTOrs8/5IJbmWEpv/5qUIA1fZjVv
 nnXMOPPaJGkNmUikuSFu17LQtZBI=
X-Received: by 2002:a25:ae47:: with SMTP id g7mr35289115ybe.110.1604481142171; 
 Wed, 04 Nov 2020 01:12:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzStnPaFzQkdLNCxNHKxZIlRW9NYevvqBTDaqIj+XZAQ8cq4Xy0bxx0YetZPHsT4LgCCvBoW/SSnks4fVBU2pE=
X-Received: by 2002:a25:ae47:: with SMTP id g7mr35289088ybe.110.1604481141879; 
 Wed, 04 Nov 2020 01:12:21 -0800 (PST)
MIME-Version: 1.0
References: <20200925121941.10475-1-rpalethorpe@suse.com>
 <CAEemH2eo6qVt0D36QVDFeW_2csWFEDnnghxRjd3_Ysu=CD-8Hw@mail.gmail.com>
 <87y2kuwa1x.fsf@suse.de>
 <CAEemH2ef9t+az4b=1zWyjuWYnUOkENL7471g0KczhUx-XFRFjQ@mail.gmail.com>
 <87eela655z.fsf@suse.de>
In-Reply-To: <87eela655z.fsf@suse.de>
From: Li Wang <liwang@redhat.com>
Date: Wed, 4 Nov 2020 17:12:09 +0800
Message-ID: <CAEemH2dA2n2k_kquCtBSZVXNF_qtteDS+QA2vZd75NBaHMcWEw@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC][PATCH] tst_cgroup: Attempt to use CGroups V2 then
 V1 instead of guessing
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
Content-Type: multipart/mixed; boundary="===============1531772590=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1531772590==
Content-Type: multipart/alternative; boundary="00000000000082cd1c05b3446060"

--00000000000082cd1c05b3446060
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

Richard Palethorpe <rpalethorpe@suse.de> wrote:

...
>
> Well, I have learnt some more about CGroups and reviewed some of our
> tests which use them and am now considering the following. This is so
> complicated that the below will probably turn out to be wrong as I try
> to implement it.
>

Glad to see your improvement plan.

It's okay, we can try it in practice. Sometimes the perfect solution
will be born in the code iteration :).


>
> 1) Scan the system for mounted Cgroup controllers and create a data
>    structure describing what controllers are mounted and where.
>
> There is only one cgroup root, it is possible to mount it multiple
> times, but it simplifies matters if we try to reuse whatever is already
> mounted. Especially in the case of V1 where remounting with different
> controller combinations will fail. Possibly there is some advantage to
> remounting, but I can't see what because changes to one mount are likely
> to be reflected in others, plus remounting is likely to fail if you
> don't use the same mount options.
>

I doubt that will be simplified to reuse the existing CGroup, It
sounds a bit idealization. Since there might be different paths
mounted on their Linux distributions or self-customized system,
we have to cover/scan all unsure situations if go this way, isn't it?


>
> 2) The user requests some controller values to be set in a unified
>    hierarchy. The LTP library then tries to translate this to whatever
>    CGroup setup the system is actually using.
>
> If no cgroups are mounted, then we try to mount a simple V2 setup
> falling back to the standard V1 setup with the (required) controllers in
> separate hierarchies. For some tests this will result in a hybrid setup
> because they first request a V2 compatible controller then a V1 only
> controller (or the inverse if there are any V2 only controllers). At
> least SUSE and Ubuntu are using hybrid setups so this is a valid thing
> to test (unfortunately).
>
+1
Yes, I totally agree to handle this kind of issue, which currently
LTP-CGroup-Lib has not done it. This is the new progress for us.


>
> If we find mounted controllers then try to create a new LTP hierarchy in
> the root of each controller (on V2 all the controllers are mounted to
> the same place, but V1 allows all kinds of stuff).
>

That sounds too complicated, there would be a situation that partly
used V2 in the root CGroup and also to use the V1-only controller
in a newly mounted V1 hierarchy.

Another concern is about the cleanup work, I'm not sure this will
be more simple or needs unify way to remove all created dir in the
hierarchy for both V2 and V1 mixed.

And, it is probably much difficult for debugging if hitting some problems.


>
> 3) The user requests some process is moved to a node of the unified
>    hierarchy for one or more controllers.
>
> Do the same setup as 2) if necessary. For V2 setups or V1 setups where
> all the controllers are mounted to the same place the controller
> argument is ignored. It is only relevant for V1 setups with separate
> hierarchies for some of the controllers. Of course a version of the
> interface can be provided without the controller argument.
>
> 4) The user requests processes are removed from our hierarchy (back to
> root) and/or we destroy our hierarchy.
>
> If we mounted any controllers unmount them, otherwise we just drain our
> hierarchy and remove it. Some tests currently just move their process
> into a cgroup (on each iteration instead of in setup) and never out of
>

Right, but at least, all of the processes will be kick-out from CGroup
hierarchy before unmounting in the cleanup phase.


> it. I don't think this makes sense, so that is another thing to
> investigate.
>
> I think the above will work for tests which are simply trying to use
> CGroup features even on systems which have an unusual V1 setup (but not
> all V1 setups). For tests which are trying to test CGroups themselves,
> then we will have to look at each test case and figure out if any code
> can be shared.
>
> For some tests (e.g. madvise06) we can provide a declarative interface
> like:
>
> tst_test.cgroup = {
>                 {"memory", "max", 256MB},
>                 {"memory", "swappiness", 60},
>                 { NULL },
> };
>
> Then the library will create a cgroup, set the memory controllers limit
> and put the test process in the cgroup. However a more thorough review
> of our cgroup usage is needed before deciding on a declarative
> interface.
>
> Note that so far I have not seen a need to create complex hierarchies
> for our tests or use threaded V2 controllers, but we will need to do
> this to test cgroups themselves. However most tests just need some basic
>

+1
That's also a long term goal for LTP and I had left open interfaces for the
purpose of extending and further development work.


> cgroup features and we can use test variants to enable random cgroup
> features on any test or implement cgroups in the test runner.
>

Good point.

Btw, I think you can try the thoughts first, as you mentioned it is
too complicated so we can't finish everything just in one time.
But the better solution will be fine out in practice I believe.

Here is the previous discussion about cover different CGroup scenarios
supporting(the end part of email), FYI:
http://lists.linux.it/pipermail/ltp/2020-June/017442.html

-- 
Regards,
Li Wang

--00000000000082cd1c05b3446060
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Richard,</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">Richard Palethorpe &lt;<a href=3D"mailto:rpalethorpe@suse.=
de" target=3D"_blank">rpalethorpe@suse.de</a>&gt; wrote:<br></div><div dir=
=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><span class=3D"gmail_default" style=3D"font-size:small">...<=
/span><br>
<br>
Well, I have learnt some more about CGroups and reviewed some of our<br>
tests which use them and am now considering the following. This is so<br>
complicated that the below will probably turn out to be wrong as I try<br>
to implement it.<br></blockquote><div><br></div><div><div class=3D"gmail_de=
fault" style=3D"font-size:small">Glad to see your improvement plan.</div></=
div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div><=
div class=3D"gmail_default" style=3D"font-size:small">It&#39;s okay, we can=
 try it in practice. Sometimes the perfect solution</div><div class=3D"gmai=
l_default" style=3D"font-size:small">will be born in the code=C2=A0<span st=
yle=3D"color:rgb(51,51,51);font-size:14px">iteration :).</span></div></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
1) Scan the system for mounted Cgroup controllers and create a data<br>
=C2=A0 =C2=A0structure describing what controllers are mounted and where.<b=
r>
<br>
There is only one cgroup root, it is possible to mount it multiple<br>
times, but it simplifies matters if we try to reuse whatever is already<br>
mounted. Especially in the case of V1 where remounting with different<br>
controller combinations will fail. Possibly there is some advantage to<br>
remounting, but I can&#39;t see what because changes to one mount are likel=
y<br>
to be reflected in others, plus remounting is likely to fail if you<br>
don&#39;t use the same mount options.<br></blockquote><div><br></div><div><=
div class=3D"gmail_default" style=3D"font-size:small">I doubt that will=C2=
=A0be simplified to reuse the existing=C2=A0CGroup, It</div><div class=3D"g=
mail_default" style=3D"font-size:small">sounds a bit idealization. Since th=
ere might be different paths</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">mounted on their Linux distributions or self-customized syste=
m,</div><div class=3D"gmail_default" style=3D"font-size:small">we have to c=
over/scan all unsure situations if go this way, isn&#39;t it?</div></div><d=
iv class=3D"gmail_default" style=3D"font-size:small">=C2=A0<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
2) The user requests some controller values to be set in a unified<br>
=C2=A0 =C2=A0hierarchy. The LTP library then tries to translate this to wha=
tever<br>
=C2=A0 =C2=A0CGroup setup the system is actually using.<br>
<br>
If no cgroups are mounted, then we try to mount a simple V2 setup<br>
falling back to the standard V1 setup with the (required) controllers in<br=
>
separate hierarchies. For some tests this will result in a hybrid setup<br>
because they first request a V2 compatible controller then a V1 only<br>
controller (or the inverse if there are any V2 only controllers). At<br>
least SUSE and Ubuntu are using hybrid setups so this is a valid thing<br>
to test (unfortunately).<br></blockquote><div><div class=3D"gmail_default" =
style=3D"font-size:small"></div><div class=3D"gmail_default" style=3D"font-=
size:small">+1</div></div><div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Yes, I totally agree to handle this kind of issue, which current=
ly</div><div class=3D"gmail_default" style=3D"font-size:small">LTP-CGroup-L=
ib has not done it. This is the new progress for us.</div></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
If we find mounted controllers then try to create a new LTP hierarchy in<br=
>
the root of each controller (on V2 all the controllers are mounted to<br>
the same place, but V1 allows all kinds of stuff).<br></blockquote><div><br=
></div><div><div class=3D"gmail_default" style=3D"font-size:small">That sou=
nds too complicated, there would be a situation that partly</div><div class=
=3D"gmail_default" style=3D"font-size:small">used V2 in the root CGroup and=
 also to use the V1-only controller</div><div class=3D"gmail_default" style=
=3D"font-size:small">in a newly mounted V1 hierarchy.=C2=A0</div></div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small"><div class=3D"gmail_default">Anoth=
er concern is about the cleanup work, I&#39;m not sure this will</div><div =
class=3D"gmail_default">be more simple or needs unify way to remove all cre=
ated dir in the</div><div class=3D"gmail_default">hierarchy for both V2 and=
 V1 mixed.</div><div class=3D"gmail_default"><br></div><div class=3D"gmail_=
default">And, it is probably much difficult for debugging if hitting some p=
roblems.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
3) The user requests some process is moved to a node of the unified<br>
=C2=A0 =C2=A0hierarchy for one or more controllers.<br>
<br>
Do the same setup as 2) if necessary. For V2 setups or V1 setups where<br>
all the controllers are mounted to the same place the controller<br>
argument is ignored. It is only relevant for V1 setups with separate<br>
hierarchies for some of the controllers. Of course a version of the<br>
interface can be provided without the controller argument.<br>
<br>
4) The user requests processes are removed from our hierarchy (back to<br>
root) and/or we destroy our hierarchy.<br>
<br>
If we mounted any controllers unmount them, otherwise we just drain our<br>
hierarchy and remove it. Some tests currently just move their process<br>
into a cgroup (on each iteration instead of in setup) and never out of<br><=
/blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-=
size:small">Right, but at least, all of the processes will be kick-out from=
 CGroup</div><div class=3D"gmail_default" style=3D"font-size:small">hierarc=
hy before unmounting in the cleanup phase.</div></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
it. I don&#39;t think this makes sense, so that is another thing to<br>
investigate.<br>
<br>
I think the above will work for tests which are simply trying to use<br>
CGroup features even on systems which have an unusual V1 setup (but not<br>
all V1 setups). For tests which are trying to test CGroups themselves,<br>
then we will have to look at each test case and figure out if any code<br>
can be shared.<br>
<br>
For some tests (e.g. madvise06) we can provide a declarative interface<br>
like:<br>
<br>
tst_test.cgroup =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;memory&quot;=
, &quot;max&quot;, 256MB},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;memory&quot;=
, &quot;swappiness&quot;, 60},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { NULL },<br>
};<br>
<br>
Then the library will create a cgroup, set the memory controllers limit<br>
and put the test process in the cgroup. However a more thorough review<br>
of our cgroup usage is needed before deciding on a declarative<br>
interface.<br>
<br>
Note that so far I have not seen a need to create complex hierarchies<br>
for our tests or use threaded V2 controllers, but we will need to do<br>
this to test cgroups themselves. However most tests just need some basic<br=
></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-size:small">+1</div><div class=3D"gmail_default" style=3D"font-size:small=
">That&#39;s also a long term goal for LTP and I had left open interfaces f=
or the</div><div class=3D"gmail_default" style=3D"font-size:small">purpose =
of=C2=A0extending and further development work.</div></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
cgroup features and we can use test variants to enable random cgroup<br>
features on any test or implement cgroups in the test runner.<br></blockquo=
te><div><br></div><div class=3D"gmail_default" style=3D"font-size:small">Go=
od point.</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">Btw, I think yo=
u can try the thoughts first, as you mentioned it is</div><div class=3D"gma=
il_default" style=3D"font-size:small">too complicated so we can&#39;t finis=
h everything just in one time.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">But the better solution will be fine out in practice I beli=
eve.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">Here is the previous=
 discussion about cover different CGroup=C2=A0<span style=3D"color:rgb(0,0,=
0);white-space:pre-wrap">scenarios</span></div><div class=3D"gmail_default"=
 style=3D"font-size:small"><span style=3D"color:rgb(0,0,0);white-space:pre-=
wrap">supporting(the end part of email)</span>, FYI:</div><div class=3D"gma=
il_default" style=3D"font-size:small"><a href=3D"http://lists.linux.it/pipe=
rmail/ltp/2020-June/017442.html">http://lists.linux.it/pipermail/ltp/2020-J=
une/017442.html</a><br></div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"><=
/div></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div>=
<div>Li Wang<br></div></div></div></div>

--00000000000082cd1c05b3446060--


--===============1531772590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1531772590==--

