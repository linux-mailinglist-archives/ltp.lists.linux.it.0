Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F5A33ECE9
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 10:24:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 33A973C2D4E
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 10:24:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 47B9D3C2CFC
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 10:24:47 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 4A1BA1A0121D
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 10:24:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615973085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+3boximzR9eftbvcfVH3gHxsm+NGqwyfAgi3gQwANSM=;
 b=OXbPMAghNEYDqOB9ImT7t9VQ90/Zl/REn9QsYJZUr0lHsCiDyk6CFW4wyFvR7P+rsUbtmF
 Lz7KjLm+GXbNnTPBTlm7ZmpUhIwqwRsPMYvfWKBGORAeM8yinvjoRVU9JPybX8GlaKv3LI
 jZrFBogR+JM8eNv4HQjXlGPWQAlAQO4=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-cYCffHDaOhSXE7ZNhDHXag-1; Wed, 17 Mar 2021 05:24:41 -0400
X-MC-Unique: cYCffHDaOhSXE7ZNhDHXag-1
Received: by mail-yb1-f198.google.com with SMTP id 194so44194219ybl.5
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 02:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+3boximzR9eftbvcfVH3gHxsm+NGqwyfAgi3gQwANSM=;
 b=i27BbYvuwc3WNv7nOj537Iau224nlnXTWRC47FIK8mZAaKSoSQxnkw9Lxkx2vepm2m
 1sqsCzWEmKO8djOgAj7xN+UpVkbVbbEWC0FAjqVG0M68zaCmzKNK/sg2XTG1H7ju7hEQ
 r+4jhCcqPM+/86MNY17UZl43NNYa7O54Fncd6lo8HZazAk8eFXoDgo96ipphk9Eh1oY4
 LBOYBa9A5MpKk4sAlazsCrePC2xFKmKTYKO79SxR1y5IICHuZ7pAOot7nnXrydRJPLG0
 KZG844nLUC5k8imZmorXngCj1gG2Dp3bf+izecLEB92yXD/3ewb70Ybub3c3ck4TQK+f
 ju4Q==
X-Gm-Message-State: AOAM532HKnH0JktMfmJKgr9Lsw+g88+MEaXdIAS0Hir0D2E61AAssjrO
 D4m8J5PquuffaNGyK9KLO/9uLrSdeR/SvndGALh417F7Bjw4qJa5l/ToK+cpnDGcn+ArDJWLmIR
 Vna2EnQS/eTEXjwQdldU/EePKz8I=
X-Received: by 2002:a25:3417:: with SMTP id b23mr3254509yba.252.1615973081258; 
 Wed, 17 Mar 2021 02:24:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKmrMlHJl6+K6ODPzV+ilSgUQ5B6BmsTqXQPYiMPOuZm9FvrQ3cMHYHaHMRrL0B162xyopXVmSBRMmMEvX+aI=
X-Received: by 2002:a25:3417:: with SMTP id b23mr3254495yba.252.1615973081109; 
 Wed, 17 Mar 2021 02:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210317083347.9791-1-pvorel@suse.cz> <YFHI5KEAI7HpgPzm@pevik>
In-Reply-To: <YFHI5KEAI7HpgPzm@pevik>
From: Li Wang <liwang@redhat.com>
Date: Wed, 17 Mar 2021 17:24:29 +0800
Message-ID: <CAEemH2dp1AJBbOu9GS0Yt4VjqVpP7z+yH0QSZmZyaC=8nDKTSw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] doc: Add Maintainer Patch Review Checklist
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
Content-Type: multipart/mixed; boundary="===============0588484433=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0588484433==
Content-Type: multipart/alternative; boundary="0000000000007769f105bdb80d1d"

--0000000000007769f105bdb80d1d
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

On Wed, Mar 17, 2021 at 5:16 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi,
>
> ...
> > +++ b/doc/maintainer-patch-review-checklist.txt
> > @@ -0,0 +1,32 @@
> > +# Maintainer Patch Review Checklist
> > +
> > +Patchset should be tested locally and ideally also in maintainer's fork
> in
> > +https://travis-ci.org/[Travis CI].
> > +
> > +Commit messages should have
> > +
> > +* author's `Signed-off-by` tag
> > +* committer's `Reviewed-by` or `Signed-off-by` tag
> > +* check also mailing lists for other reviewers / testers
>
> Also add:
> Please update patchset status in
> https://patchwork.ozlabs.org/project/ltp/list/[LTP patchwork].
>

Also Add:

Please update LTP WIKI if touch doc/*.txt.
https://github.com/linux-test-project/ltp.wiki.git

Otherwise, LGTM.

-- 
Regards,
Li Wang

--0000000000007769f105bdb80d1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Mar 17, 2021 at 5:16 PM Petr Vorel &l=
t;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
...<br>
&gt; +++ b/doc/maintainer-patch-review-checklist.txt<br>
&gt; @@ -0,0 +1,32 @@<br>
&gt; +# Maintainer Patch Review Checklist<br>
&gt; +<br>
&gt; +Patchset should be tested locally and ideally also in maintainer&#39;=
s fork in<br>
&gt; +<a href=3D"https://travis-ci.org/%5BTravis" rel=3D"noreferrer" target=
=3D"_blank">https://travis-ci.org/[Travis</a> CI].<br>
&gt; +<br>
&gt; +Commit messages should have<br>
&gt; +<br>
&gt; +* author&#39;s `Signed-off-by` tag<br>
&gt; +* committer&#39;s `Reviewed-by` or `Signed-off-by` tag<br>
&gt; +* check also mailing lists for other reviewers / testers<br>
<br>
Also add:<br>
Please update patchset status in <a href=3D"https://patchwork.ozlabs.org/pr=
oject/ltp/list/%5BLTP" rel=3D"noreferrer" target=3D"_blank">https://patchwo=
rk.ozlabs.org/project/ltp/list/[LTP</a> patchwork].<br></blockquote><div><b=
r></div><div><div class=3D"gmail_default" style=3D"font-size:small">Also Ad=
d:</div></div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">Please update LT=
P WIKI if touch doc/*.txt.</div><div class=3D"gmail_default" style=3D"font-=
size:small"><a href=3D"https://github.com/linux-test-project/ltp.wiki.git">=
https://github.com/linux-test-project/ltp.wiki.git</a></div><div class=3D"g=
mail_default" style=3D"font-size:small"></div></div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">Otherwise, LGTM.</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_si=
gnature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></di=
v></div></div>

--0000000000007769f105bdb80d1d--


--===============0588484433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0588484433==--

