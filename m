Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C96131EB8
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jan 2020 05:57:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1F1F3C24D6
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jan 2020 05:56:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id DF10E3C2461
 for <ltp@lists.linux.it>; Tue,  7 Jan 2020 05:56:53 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 17E671A00922
 for <ltp@lists.linux.it>; Tue,  7 Jan 2020 05:56:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578373011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oixqjJOdPSNzjcgDqxAw1LVtnYYgWBiJzQ5vuRrklHE=;
 b=Ugn5xIONt25vdSbEWIvxARzhUuTXKcl5jAzXC4E6Z6szmAB1D/t4yrtXHTW1c6f6wyn8Bn
 J+Qx0E4aL3rxIG6XB+uczlfp91KNIHHdt9paGhzu87us9VnDeRNf4cbFxam1vmhuFDyBBg
 N8DiDNiwna7Gp8kGDfQZ/nWdGh6uyBw=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-A5qd7DXtMpuqrZ-7p16Vzg-1; Mon, 06 Jan 2020 23:56:46 -0500
Received: by mail-oi1-f198.google.com with SMTP id n130so3739319oib.5
 for <ltp@lists.linux.it>; Mon, 06 Jan 2020 20:56:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+CFxD30v8s3stRxLV+dMBEEEC5faTSnhV6op7OAHoL0=;
 b=D//iBSUooc7wL85MKTFcKH7BJXgUpWvj4JeSFG4JBb54GOix0d5hYeQN8iyzQMBZ0i
 NE+Q0RJQsGbyhivcBk+q9gj7C61BSIVVJYxfOa4nqH20O2D1aelfi1Nu1E7CwAnsFaK8
 5shkGEWk1XYZ7pWurz8tfmYx1ypQU11fMGCKTwdRZGachUv0QiQw8jzOTEiXkO6CgZW/
 YQqb3c1vGw2sA/56Jh5/GAi0KkpU6PoQ7fta47RcVbBHvujjG+D6g6kneGoMwYhTcRxJ
 Tml65/T0PHHAF5c9FSZHqBdJVt+5f/pIjDItsFhIwr2Qw3eVob/JuRNdXb4eE1VW9/f5
 lOZw==
X-Gm-Message-State: APjAAAVFTB8enUtRJYVbrLNIr7ToSxvtHHHD3rayv7PnIufLfQM1B78a
 7b1xLWNb8CwgM+IuU9QFfrH7jSYUONRS6iPaNC8MuOUq+T2T3roAiCej6WjQigOOYwFqmbhjXwN
 nayyqkhLTpMjXjtWyoW1smR8iCX4=
X-Received: by 2002:a9d:7:: with SMTP id 7mr112919986ota.26.1578373005336;
 Mon, 06 Jan 2020 20:56:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqzcs0lzoItgu3Gm5Q21GyC9mBO5VAydy0QP1GKOGUEFvz98b4LmsCMNdmefI6Aj+cSzuWghsX7IUJmVdQeX1yA=
X-Received: by 2002:a9d:7:: with SMTP id 7mr112919959ota.26.1578373005035;
 Mon, 06 Jan 2020 20:56:45 -0800 (PST)
MIME-Version: 1.0
References: <1576641763-18305-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2eKbbXjonuiKMdHcRda98hJikmGW4=YtWft0-1QAj0oBQ@mail.gmail.com>
 <8a1a9b95-5c42-2176-857a-e3c36fa42b55@cn.fujitsu.com>
In-Reply-To: <8a1a9b95-5c42-2176-857a-e3c36fa42b55@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 7 Jan 2020 12:56:33 +0800
Message-ID: <CAEemH2djB=2=HD=RQxkABDzFt5ZOZr+iVT3_chahSoZSLhoqqQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-MC-Unique: A5qd7DXtMpuqrZ-7p16Vzg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/userfaultfd01: add hint about
 unprivileged_userfaultfd
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
Content-Type: multipart/mixed; boundary="===============0849186894=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0849186894==
Content-Type: multipart/alternative; boundary="0000000000004a0997059b859aac"

--0000000000004a0997059b859aac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yang,

On Mon, Jan 6, 2020 at 5:10 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote=
:

> ...
> > Can we do the "vm.unprivileged_userfaultfd" check in the setup() and do
> > set to 1 if it exists?
> I remembered Jan Stancek has a patch about bpf hint about
> unprivileged_bpf_disabled, I do as same as that patch did.
>
> Also, month agos about acct02 discussion, Cyril points about adjusting
> the threshold value of resume and suppend to make case passes.
>
> So, I have a question that we have unified standards about these cases
> (bpf, acct02, affected by sysctl)? Report TCONF or modify argument to
> make case passes?
>

After thinking over, to report TCONF is the wise method here because this
test might run with an unprivileged user and it can not modify the knob
"vm.unprivileged_userfaultfd".

Sorry and now I pull back my last comment.

Reviewed-by: Li Wang <liwang@redhat.com>

--=20
Regards,
Li Wang

--0000000000004a0997059b859aac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Yang,</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 6, 2020 at 5:10 PM Yang Xu &lt=
;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" target=3D"_blank">xuyang20=
18.jy@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><span class=3D"gmail_default" style=3D"font-size:small"=
>...</span><br>
&gt; Can we do the &quot;vm.unprivileged_userfaultfd&quot; check in the set=
up() and do <br>
&gt; set to 1 if it exists?<br>
I remembered Jan Stancek has a patch about bpf hint about <br>
unprivileged_bpf_disabled, I do as same as that patch did.<br>
<br>
Also, month agos about acct02 discussion, Cyril points about adjusting<br>
the threshold value of resume and suppend to make case passes.<br>
<br>
So, I have a question that we have unified standards about these cases<br>
(bpf, acct02, affected by sysctl)? Report TCONF or modify argument to<br>
make case passes?<br></blockquote><div><br></div><div><div class=3D"gmail_d=
efault" style=3D"font-size:small">After thinking over, to report TCONF is t=
he wise method here because this test might run with an unprivileged=C2=A0u=
ser and it can not modify the knob &quot;vm.unprivileged_userfaultfd&quot;.=
</div></div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">Sorry and now I pu=
ll back my last comment.</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div><div class=3D"gmail_default" style=3D"font-size:sm=
all"></div><div class=3D"gmail_default" style=3D"font-size:small">Reviewed-=
by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwa=
ng@redhat.com</a>&gt;</div></div><div>=C2=A0</div></div>-- <br><div dir=3D"=
ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></=
div></div>

--0000000000004a0997059b859aac--


--===============0849186894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0849186894==--

