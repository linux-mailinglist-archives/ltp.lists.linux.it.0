Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA521B4385
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 13:49:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 030BD3C2978
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 13:49:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 685FE3C2962
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 13:49:39 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id E26931000A20
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 13:49:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587556177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pLq3Za0ucac4NyA7xXjzfS6by4mfExRkuWqT3/Jw+mU=;
 b=iv/wW/Ylg8r5ufPds2LxIodtJujLkfla2nUD/i5POklELSnaPofJ3BN4prYWYEMExW6Hc/
 x+FjnMt/4ZUo3AYY4ZbE9iPvrsUSUa9lFgHh/lqNzf2PgrNh0eiwAgwBvEbdyICfUY0vKb
 KM7YZpHaCPY7Us9CWGsriAHbxonYzfs=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-VJfL-dw-NUa5uYCWrO55Jw-1; Wed, 22 Apr 2020 07:49:34 -0400
X-MC-Unique: VJfL-dw-NUa5uYCWrO55Jw-1
Received: by mail-lf1-f71.google.com with SMTP id v22so815514lfa.1
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 04:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+HvFuaCWLtVDW/YlpbB3njkuAC3fC0wyA7tiV+uX6fc=;
 b=UiJuEoLMl8cOO2udx9Og0VXfHM+L7ieV3x0S0Wk0G87mkf7jzxyrWdGiUj+HhxQgNf
 wPC5Dxm87Ui/Su+XkO4LQSfoDAj3Ink/jabZhS/QWCcxTmswYrnofl3IqXfQj2Vtaa9Q
 HTDmqJUCRCkAOnJyC6BM29DzPBc0PB1DkmISe2cdkYGyjx8PMxeYDmbzeXOzURlApdcK
 WLHA7gW1O6jMCFseTOxgQTJgIrNkKJ7kuqdFWSnJs/+vlKxsVE9Z/9QyGjW7gSMAgL3S
 ePSwuU9xTaPMIG+zWLpAK3sVABVnozFkcTnIxUpbte8JRyZgw/oQAmqiWceDIGXtVcGJ
 +2LA==
X-Gm-Message-State: AGi0PuaSPiloxkGEbHCToVHsNYYALtbxnToJE7/SjIA1orubCfiMU5To
 x1eWBCNLRwIgXGIoH8DhauRTCDHHDN7Sc2YAwLUldhRCRa4CT53v69xb/3mDo15YvqkkxkM6YaY
 1ZsmJUfx9326F7G9hBqL3usF2+1g=
X-Received: by 2002:a2e:8549:: with SMTP id u9mr11025746ljj.24.1587556173273; 
 Wed, 22 Apr 2020 04:49:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypIXa0vqa7NpUxuIwPva2Hsksx/ttwm/XSTmkp1+mbTgF9oovPhvzS62O7tgktR05GD7sW34r9qGxdf79SCUlBA=
X-Received: by 2002:a2e:8549:: with SMTP id u9mr11025735ljj.24.1587556173064; 
 Wed, 22 Apr 2020 04:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <bc3c52ff5b97feefa4200c3d87002de5a61ee360.1587539566.git.jstancek@redhat.com>
 <3529bb886952f26fa38095ce99ceef115f71cb18.1587554860.git.jstancek@redhat.com>
In-Reply-To: <3529bb886952f26fa38095ce99ceef115f71cb18.1587554860.git.jstancek@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 22 Apr 2020 19:49:21 +0800
Message-ID: <CAEemH2e_h+4_nMTaVVtu9ngewvV_qrzVvtnKrqhQPCzZxDY80w@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] hugetlb: check for requested huge pages first
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
Content-Type: multipart/mixed; boundary="===============0026342258=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0026342258==
Content-Type: multipart/alternative; boundary="000000000000c1c73a05a3dfb915"

--000000000000c1c73a05a3dfb915
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2020 at 7:40 PM Jan Stancek <jstancek@redhat.com> wrote:

> /sys/kernel/mm/hugepages is not present when there are no
> supported hugepage sizes. This is common for ppc64le KVM guests,
> when hypervisor does not enable hugepages. Guest will boot with:
>   hugetlbfs: disabling because there are no supported hugepage sizes
>
>   # cat /proc/filesystems  | grep huge; echo $?
>   1
>
> Move the check up in setup to check it as first thing to avoid
> running into TBROK on mount or set_sys_tune when hugetlbfs is
> not available:
>   safe_macros.c:766: BROK: hugemmap01.c:82: mount(none,
> /mnt/testarea/ltp-07Kg6lCOmm/Ai9D0M, hugetlbfs, 0, (nil)) failed: ENODEV
> (19)
>   safe_macros.c:766: BROK: hugemmap02.c:129: mount(none,
> /mnt/testarea/ltp-07Kg6lCOmm/Cxf7A6, hugetlbfs, 0, (nil)) failed: ENODEV
> (19)
>   safe_macros.c:766: BROK: hugemmap04.c:100: mount(none,
> /mnt/testarea/ltp-07Kg6lCOmm/kS60Mk, hugetlbfs, 0, (nil)) failed: ENODEV
> (19)
>   safe_file_ops.c:219: BROK: Expected 1 conversions got 0 at
> hugemmap06.c:42
>   safe_file_ops.c:155: BROK: The FILE '/proc/sys/vm/nr_hugepages' ended
> prematurely at mem.c:836
>   safe_file_ops.c:219: BROK: Expected 1 conversions got 0 at
> hugeshmat05.c:39
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
>
Acked-by: Li Wang <liwang@redhat.com>

This is obviously right! ACK.

--=20
Regards,
Li Wang

--000000000000c1c73a05a3dfb915
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Apr 22, 2020 at 7:40 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">/sys/kernel/mm/hugep=
ages is not present when there are no<br>
supported hugepage sizes. This is common for ppc64le KVM guests,<br>
when hypervisor does not enable hugepages. Guest will boot with:<br>
=C2=A0 hugetlbfs: disabling because there are no supported hugepage sizes<b=
r>
<br>
=C2=A0 # cat /proc/filesystems=C2=A0 | grep huge; echo $?<br>
=C2=A0 1<br>
<br>
Move the check up in setup to check it as first thing to avoid<br>
running into TBROK on mount or set_sys_tune when hugetlbfs is<br>
not available:<br>
=C2=A0 safe_macros.c:766: BROK: hugemmap01.c:82: mount(none, /mnt/testarea/=
ltp-07Kg6lCOmm/Ai9D0M, hugetlbfs, 0, (nil)) failed: ENODEV (19)<br>
=C2=A0 safe_macros.c:766: BROK: hugemmap02.c:129: mount(none, /mnt/testarea=
/ltp-07Kg6lCOmm/Cxf7A6, hugetlbfs, 0, (nil)) failed: ENODEV (19)<br>
=C2=A0 safe_macros.c:766: BROK: hugemmap04.c:100: mount(none, /mnt/testarea=
/ltp-07Kg6lCOmm/kS60Mk, hugetlbfs, 0, (nil)) failed: ENODEV (19)<br>
=C2=A0 safe_file_ops.c:219: BROK: Expected 1 conversions got 0 at hugemmap0=
6.c:42<br>
=C2=A0 safe_file_ops.c:155: BROK: The FILE &#39;/proc/sys/vm/nr_hugepages&#=
39; ended prematurely at mem.c:836<br>
=C2=A0 safe_file_ops.c:219: BROK: Expected 1 conversions got 0 at hugeshmat=
05.c:39<br>
<br>
Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targe=
t=3D"_blank">jstancek@redhat.com</a>&gt;<br></blockquote><div><span class=
=3D"gmail_default" style=3D"font-size:small"></span></div><div><span class=
=3D"gmail_default" style=3D"font-size:small">Acked-by: Li Wang &lt;<a href=
=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</span></div><div><s=
pan class=3D"gmail_default" style=3D"font-size:small"><br></span></div><div=
><span class=3D"gmail_default" style=3D"font-size:small">This is obviously =
right! ACK.</span></div><div><span class=3D"gmail_default" style=3D"font-si=
ze:small"></span>=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></d=
iv></div></div>

--000000000000c1c73a05a3dfb915--


--===============0026342258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0026342258==--

