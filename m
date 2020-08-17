Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 241E8245BA6
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 06:38:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B32653C3021
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 06:38:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id E611E3C2FFD
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 06:38:17 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 6FA346005E1
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 06:38:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597639096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TjkfI38IQu7G3IAfO+x6c0yo011ZrxBxkjp8lgS/cHo=;
 b=JEUj+Z5C25nSF7oLxpTSDppzCUEJkWBe4xQCQeSSv3BTAtUxhCqmMlvEKyjX0K/IUJz+fu
 BL7A0m1EOQayRlw9KPDWbsxkBky4KRRlPuN5B0ikenD+m6e3jSXp2hm3U3/4pr//2YNjgD
 boRQW8CPj4XjasxN9qCgU8ku6EIi6Iw=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-WDsuuKwzNBCwn8YcCX0ReA-1; Mon, 17 Aug 2020 00:38:13 -0400
X-MC-Unique: WDsuuKwzNBCwn8YcCX0ReA-1
Received: by mail-yb1-f198.google.com with SMTP id a5so17105382ybh.3
 for <ltp@lists.linux.it>; Sun, 16 Aug 2020 21:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TjkfI38IQu7G3IAfO+x6c0yo011ZrxBxkjp8lgS/cHo=;
 b=cMxQB4pT100Gswfq2IeJCfdlDrcKZJgnSlkAswJCrEYnQHzQ42kctMPecmkJ9r9JUN
 hgwPAOWLSAgSxeUho8nUyckRphjdnnF9lyfK4Cn70qJnEVxn6ngCu+j93+1Icc/HBprN
 S/f5BBUgPR1gKTj26wTNtP9IBJXtJBfKMp0aAw9sBaXCpcBKDBtBBHGmoVUtHusDadYM
 RaSe7YXYotBvxxdRXDhSgKcloqMZLJnkcmDCv/ubsbVHj8Bbfhz1C/Shdb4J82TW3lIi
 WaBCPxN0ikjnwKF1RuLLo1yGoAA3qJipTn77wiQwel1S46sO3Hs5hNt6wZYksRsDlNI2
 vE2Q==
X-Gm-Message-State: AOAM533woGnreVIvd9gikQWmh2UVxW0FqRgjs7Y9D2N/bl+3qBVox23y
 CkYkTPinLB92XcwzhU1pNwnaMVJWItoBltLP6rIuS1F5Q7Aw/T/6p+Hp22jUfckoYORMhLzYaUt
 W5fS+dTqAvacrWFJ5rnjFgGhzFTo=
X-Received: by 2002:a25:da82:: with SMTP id
 n124mr17846305ybf.366.1597639092674; 
 Sun, 16 Aug 2020 21:38:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/PIiR5IDvHRhnypfeDHTLk7/l8e8GPyhJzDG47UdJUUNJYmFNuP0ouosDY4ek7gJpRB3SfPPTefBv62rFdhQ=
X-Received: by 2002:a25:da82:: with SMTP id
 n124mr17846291ybf.366.1597639092479; 
 Sun, 16 Aug 2020 21:38:12 -0700 (PDT)
MIME-Version: 1.0
References: <1596848534-1901-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1596848534-1901-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 17 Aug 2020 12:37:59 +0800
Message-ID: <CAEemH2cD9oTuUht=CeuD_RgR=0KLGY6sRH25nmTsN0NEc7M86Q@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] lib/tst_cgroup: Reset cgroup.clone_children
 value
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
Content-Type: multipart/mixed; boundary="===============0328266571=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0328266571==
Content-Type: multipart/alternative; boundary="0000000000009648a105ad0b56a0"

--0000000000009648a105ad0b56a0
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 8, 2020 at 9:02 AM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:

> When running cgroup test cases(like cpuset01 or oom05) about cpuset
> subsystem
> firstly, then cpuset_inherit case will fail because the value of
> cgroup.clone_children has been changed into 1 on cgroup-v1. Reset this
> value
> when calling tst_cgroupN_umount.
>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>

I have tested and applied the patch. Thanks Xu!

-- 
Regards,
Li Wang

--0000000000009648a105ad0b56a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat, Aug 8, 2020 at 9:02 AM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">When r=
unning cgroup test cases(like cpuset01 or oom05) about cpuset subsystem<br>
firstly, then cpuset_inherit case will fail because the value of<br>
cgroup.clone_children has been changed into 1 on cgroup-v1. Reset this valu=
e<br>
when calling tst_cgroupN_umount.<br>
<br>
Signed-off-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" =
target=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br></blockquote><div=
><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">I ha=
ve tested and applied the=C2=A0patch. Thanks Xu!</div></div><div><br></div>=
</div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><d=
iv>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000009648a105ad0b56a0--


--===============0328266571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0328266571==--

