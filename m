Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4982573DC
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Aug 2020 08:41:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9ECE13C2DC6
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Aug 2020 08:41:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 827513C2DB2
 for <ltp@lists.linux.it>; Mon, 31 Aug 2020 08:41:12 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 83A862003A6
 for <ltp@lists.linux.it>; Mon, 31 Aug 2020 08:41:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598856070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JQ3Kj9R/xtRNQSEVTfa2YruJTl79wt8W5CrWy8OJgtY=;
 b=S25CSfCqcZ+KpBQq6XngRGJ+v6U4FVUX2fZ3tLwbhDyz4LzZD7Q/VuSA8jCKGqgnjCaeK6
 SKewD9j1JDwX82slyPkCKg++Rci96BZZQkhbMwjoo4MM8u4iw70N8gMgE14Uohjo2+Snob
 o3BaYYYQ4SE8bpN0L0erwm+eyfpj2zo=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-0NcMrZpGPle9NvPKWZ1LzQ-1; Mon, 31 Aug 2020 02:41:06 -0400
X-MC-Unique: 0NcMrZpGPle9NvPKWZ1LzQ-1
Received: by mail-yb1-f198.google.com with SMTP id e1so8371325ybk.14
 for <ltp@lists.linux.it>; Sun, 30 Aug 2020 23:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JQ3Kj9R/xtRNQSEVTfa2YruJTl79wt8W5CrWy8OJgtY=;
 b=VIMLil6QpVID+kr5iDs8+p4BCZx8aGltRPluezWJ5s6bp5/oNR6u8jNwEXkCmyZRcV
 wFHgOwFZUnkmicWoKpJ3sC8wR0sXgMLGLzAyzGV7LI63cl+s5cpxQbmdB7MgE8O/YJqt
 jGJbSNyHMqpJoJrJQzRW4LhhTtjVoZsWxVwerg1vFEespcvRTm3qqdjgqoCbacYK56A6
 CO8HAkMhj5lvq8irqrMjY5iwhYH58w8w0luEqaKq8JvMC0nH/Pv6dQ7qDXS7Z9RVmMe2
 mLhNXgof7FpkvAUJr+HmQBOprURjZd+RFLP/F1NOd6WKQnr4Kt/iUdjSxqKRizcKz1gE
 W1Qw==
X-Gm-Message-State: AOAM532iQmailh/S7l2+GkyZqWlvZs5PBuF6JQXyY1MgBz7NklHFDQN2
 BXbhh2YhJ7Q5uqN0KwAJuu3qZA2CmIIbEh/cXwUE34E0ECosrdmlg/1TRMVXos5E2Rbht7NRmLv
 FLCJrjSpOBqCrVZBc+ESfqlvOT2g=
X-Received: by 2002:a25:cc14:: with SMTP id l20mr354688ybf.110.1598856065717; 
 Sun, 30 Aug 2020 23:41:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHI/VJ60QYE9VG3sBMaMvEVNCHuRhn6kIWL3huidwEht8414JkcqsYXFGFSoV8cmdLfCWpDAJqjrCcxOHo78o=
X-Received: by 2002:a25:cc14:: with SMTP id l20mr354672ybf.110.1598856065513; 
 Sun, 30 Aug 2020 23:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200811180604.4073173-1-aiden.gaoyuan@gmail.com>
 <CAEemH2dxX2-t7S0TN3p7=zMLY_=TquSZdKUgqDRE9fpg_t8hdA@mail.gmail.com>
 <CAJuCfpH_Y6HwtZAiNLzBAf7q7MPjJe2UBchdthMkSc9v0SQ6bg@mail.gmail.com>
In-Reply-To: <CAJuCfpH_Y6HwtZAiNLzBAf7q7MPjJe2UBchdthMkSc9v0SQ6bg@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 31 Aug 2020 14:40:53 +0800
Message-ID: <CAEemH2fKBczyzUXJ+sfcuHkXuj9U-nzs2rWmUpGS7=qGqu=bsw@mail.gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] hotplug/memory_hotplug: Handle NULL
 returned by strtok_r when parsing inputs
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
Cc: kernel-team <kernel-team@android.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0410142192=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0410142192==
Content-Type: multipart/alternative; boundary="000000000000d5142605ae26af7b"

--000000000000d5142605ae26af7b
Content-Type: text/plain; charset="UTF-8"

Hi Suren,

On Fri, Aug 21, 2020 at 7:41 AM Suren Baghdasaryan <surenb@google.com>
wrote:

> Hi Li,
>
> On Thu, Aug 20, 2020 at 2:16 AM Li Wang <liwang@redhat.com> wrote:
> >
> > Hi Yuan,
> >
> > Thanks for contributing to the memory-hotplug test. I have no objection
> to these patches, but it seems quite a long time(since it imported to LTP
> from Linux foundation at the year 2008) nobody actually touches this memtoy
> except some code cleanup work.
> >
> > I'm wondering whether you guys play with the memtoy regularly? and how
> do you use it?
>
> We did use memtoy to run memory experiments on Android (required some
> minor tweaks to be able to build on Android). After Yuan's fixes we
> were able to use it quite successfully.
>

Ok, I helped merge the patchset after testing. Thanks.


>
> >
> > I take a rough look at the README file but got nothing useful to get a
> start.
>
> You can see one of the scripts Yuan developed to ramp up memory
> allocations of a given type (anon/file-backed/ion) using memtoy here:
>
> https://android-review.googlesource.com/c/platform/external/ltp/+/1344879/44/testcases/kernel/hotplug/memory_hotplug/Scripts/ramp.sh
> The usage is currently for experimentation only but we find it pretty
> handy and we would like to keep using it in the future.
>

Yes, it also looks good to me. Maybe you can consider to upstreaming the
ramp.sh too.

-- 
Regards,
Li Wang

--000000000000d5142605ae26af7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Suren,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Aug 21, 2020 at 7:41 AM Suren Baghdas=
aryan &lt;<a href=3D"mailto:surenb@google.com" target=3D"_blank">surenb@goo=
gle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Hi Li,<br>
<br>
On Thu, Aug 20, 2020 at 2:16 AM Li Wang &lt;<a href=3D"mailto:liwang@redhat=
.com" target=3D"_blank">liwang@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Yuan,<br>
&gt;<br>
&gt; Thanks for contributing to the memory-hotplug test. I have no objectio=
n to these patches, but it seems quite a long time(since it imported to LTP=
 from Linux foundation at the year 2008) nobody actually touches this memto=
y except some code cleanup work.<br>
&gt;<br>
&gt; I&#39;m wondering whether you guys play with the memtoy regularly? and=
 how do you use it?<br>
<br>
We did use memtoy to run memory experiments on Android (required some<br>
minor tweaks to be able to build on Android). After Yuan&#39;s fixes we<br>
were able to use it quite successfully.<br></blockquote><div><br></div><div=
><div class=3D"gmail_default" style=3D"font-size:small">Ok, I helped merge =
the patchset after testing. Thanks.</div></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; I take a rough look at the README file but got nothing useful to get a=
 start.<br>
<br>
You can see one of the scripts Yuan developed to ramp up memory<br>
allocations of a given type (anon/file-backed/ion) using memtoy here:<br>
<a href=3D"https://android-review.googlesource.com/c/platform/external/ltp/=
+/1344879/44/testcases/kernel/hotplug/memory_hotplug/Scripts/ramp.sh" rel=
=3D"noreferrer" target=3D"_blank">https://android-review.googlesource.com/c=
/platform/external/ltp/+/1344879/44/testcases/kernel/hotplug/memory_hotplug=
/Scripts/ramp.sh</a><br>
The usage is currently for experimentation only but we find it pretty<br>
handy and we would like to keep using it in the future.<br></blockquote><di=
v><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Yes=
, it also looks good to me. Maybe you can consider to upstreaming the ramp.=
sh too.</div></div></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D=
"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000d5142605ae26af7b--


--===============0410142192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0410142192==--

