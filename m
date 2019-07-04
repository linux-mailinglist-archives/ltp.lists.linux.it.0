Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1C55F1CC
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 05:29:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C502C3C1DA5
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 05:29:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id BB0FD3C1D52
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 05:29:24 +0200 (CEST)
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2F0AA1400528
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 05:29:22 +0200 (CEST)
Received: by mail-vs1-f67.google.com with SMTP id 190so1130197vsf.9
 for <ltp@lists.linux.it>; Wed, 03 Jul 2019 20:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=61djNddAs5Tr56ygUvFtCuHTe5z6u1mgNRRaPJIJ9PU=;
 b=Q8WnDfrPdpFuldvRY7OtPnc52v5nrKlhgE8EppoxU9TsEXNGCM2kFS1TxzH/eM4LdG
 AB02qkkoPzGWczrjN+1ZdLC1kOVhJcVwt52sTITbRsq0XOuLjyvLNylik8tCXkLK/GVy
 gguNCVs9tCffJV2wmwURrZ13OyAMsI3y1aWUJNxzyk1yWclYn21wrGTc6Jra8emZ29Pj
 TNppqyorrjcqkrb60opNG0xGIK0qAw4AjpN4g2O4mP5iiUFv83cfC+5swKvoJxCIC1l5
 mGjpoJXljchuXt0C8Dv2Ol8auQHBaIcb3N2ovKUBJ+HLzLqlIqD/zOKaW3uLXt71BL8k
 5kgw==
X-Gm-Message-State: APjAAAVhqk+P9gsCV5/jDNmdblCAJBXLWPhBJ3pPIYYRu3J4xJjkqBtI
 lgHIVC5WJJ1W1nZ0QJuTmGxQ3o9rig8C69JmCjrVmA==
X-Google-Smtp-Source: APXvYqyZa6zsnK/GYwQxNU7CVgTO7cfMdwILvm9/9nA4xtvaATD59aW/Cu3YFZhTr/gBzEk4b24AWwGrsWJNOI1kCG8=
X-Received: by 2002:a67:11c1:: with SMTP id 184mr20307130vsr.217.1562210960928; 
 Wed, 03 Jul 2019 20:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190607095213.13372-1-liwang@redhat.com>
 <20190610032754.GA7114@hori.linux.bs1.fc.nec.co.jp>
 <5D0C7204.9020704@cn.fujitsu.com>
 <CAEemH2c+CWAOmAH=1WT+GR-iZ=5RoDcCmD=-zBpc63PHg6xXyQ@mail.gmail.com>
 <5D142EF6.6030402@cn.fujitsu.com>
In-Reply-To: <5D142EF6.6030402@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 4 Jul 2019 11:29:09 +0800
Message-ID: <CAEemH2dHGvv_fP3AFstX5Corc4D0pK_ULGxANzkf4+biR5WC-A@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC] move_pages12: handle errno EBUSY for
 madvise(..., MADV_SOFT_OFFLINE)
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
Cc: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0336046696=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0336046696==
Content-Type: multipart/alternative; boundary="000000000000642c37058cd295ba"

--000000000000642c37058cd295ba
Content-Type: text/plain; charset="UTF-8"

Hi Xu,

On Thu, Jun 27, 2019 at 10:50 AM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> ...
>> Hi Li
>>
>> Your patch can handle EBUSY errno correctly for soft offline.
>> But move page  may be killed by SIGBUS because of  MCE  when we soft
>> offline concurrently.
>> That leads to move_page failed with ESRCH.   Also, move page may fails
>> with ENOMEM .
>> Do you notice it ?
>>
>
> I didn't get this failure, it seems not related to this patch. Two
> questions:
>
> 1. which kernel version do you test?
> 2. can you reproduce this without my patch?
>
> Hi Li
>
> I test it on 3.10.0-957.el7.x86_64  kvm(my machine was not support numa
> and i enable it on kvm. as below:
>  <cpu mode='custom' match='exact' check='full'>
>     <model fallback='forbid'>Penryn</model>
>     <feature policy='require' name='x2apic'/>
>     <feature policy='require' name='hypervisor'/>
>     <numa>
>       <cell id='0' cpus='0' memory='1048576' unit='KiB'/>
>       <cell id='1' cpus='1' memory='1048576' unit='KiB'/>
>     </numa>
>   </cpu>
>
> Does it only exist on kvm and doesn't  exist on physical machine?  I don't
> have physical machine that supports numa.
>

I can reproduce your problem on bare metal too, it seems like you hit the
bug as the commit 6bc9b56433b (mm: fix race on soft-offlining free huge
pages) described, which Naoya pointed out before:

See:

+               /*
+                * We set PG_hwpoison only when the migration source
hugepage
+                * was successfully dissolved, because otherwise hwpoisoned
+                * hugepage remains on free hugepage list, then userspace
will
+                * find it as SIGBUS by allocation failure. That's not
expected
+                * in soft-offlining.
+                */
+               ret = dissolve_free_huge_page(page);
+               if (!ret) {
+                       if (set_hwpoison_free_buddy_page(page))
+                               num_poisoned_pages_inc();
+               }

And, this bz still exists in the latest rhel7 kernel, I will open a bug to
RHEL7 product.

-- 
Regards,
Li Wang

--000000000000642c37058cd295ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu,</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Thu, Jun 27, 2019 at 10:50 AM Yang Xu &lt;<a h=
ref=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><u>=
</u>

 =20
   =20
 =20
  <div bgcolor=3D"#ffffff">
    <blockquote type=3D"cite"><div dir=3D"ltr"><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_defau=
lt" style=3D"font-size:small">...</span><br>
            Hi Li<br>
            <br>
            Your patch can handle EBUSY errno correctly for soft
            offline. <br>
            But move page=C2=A0 may be killed by SIGBUS because of=C2=A0 MC=
E=C2=A0 when
            we soft offline concurrently.=C2=A0 <br>
            That leads to move_page failed with ESRCH.=C2=A0 =C2=A0Also, mo=
ve page
            may fails with ENOMEM .<br>
            Do you notice it ?<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div style=3D"font-size:small">I
              didn&#39;t get this failure, it seems not related to this
              patch. Two questions:</div>
            <div style=3D"font-size:small"><br>
            </div>
            <div style=3D"font-size:small">1.
              which kernel version do you test?</div>
            <div style=3D"font-size:small">2. can
              you reproduce this without my patch?</div>
          </div>
        </div>
      </div>
    </blockquote>
    Hi Li<br>
    <br>
    I test it on 3.10.0-957.el7.x86_64=C2=A0 kvm(my machine was not support
    numa and i enable it on kvm. as below: <br>
    =C2=A0&lt;cpu mode=3D&#39;custom&#39; match=3D&#39;exact&#39; check=3D&=
#39;full&#39;&gt;<br>
    =C2=A0=C2=A0=C2=A0 &lt;model fallback=3D&#39;forbid&#39;&gt;Penryn&lt;/=
model&gt;<br>
    =C2=A0=C2=A0=C2=A0 &lt;feature policy=3D&#39;require&#39; name=3D&#39;x=
2apic&#39;/&gt;<br>
    =C2=A0=C2=A0=C2=A0 &lt;feature policy=3D&#39;require&#39; name=3D&#39;h=
ypervisor&#39;/&gt;<br>
    =C2=A0=C2=A0=C2=A0 &lt;numa&gt;<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;cell id=3D&#39;0&#39; cpus=3D&#39;0&=
#39; memory=3D&#39;1048576&#39; unit=3D&#39;KiB&#39;/&gt;<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;cell id=3D&#39;1&#39; cpus=3D&#39;1&=
#39; memory=3D&#39;1048576&#39; unit=3D&#39;KiB&#39;/&gt;<br>
    =C2=A0=C2=A0=C2=A0 &lt;/numa&gt;<br>
    =C2=A0 &lt;/cpu&gt;<br>
    <br>
    Does it only exist on kvm and doesn&#39;t=C2=A0 exist on physical machi=
ne?=C2=A0 I
    don&#39;t have physical machine that supports numa.<br></div></blockquo=
te><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:smal=
l">I can reproduce your problem on  bare metal too, it seems like you hit t=
he bug as the commit 6bc9b56433b (<span class=3D"gmail_default"></span>mm: =
fix race on soft-offlining free huge pages) described, which Naoya pointed =
out before:</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">See:</div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /*</div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* We set PG_hwpoison only when the migration source hugepage<br>+=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* was successfully =
dissolved, because otherwise hwpoisoned<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0* hugepage remains on free hugepage list, then u=
serspace will<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=
 find it as SIGBUS by allocation failure. That&#39;s not expected<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* in soft-offlining.<br=
>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D dissolve_free_huge_page(p=
age);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ret) {<br>=
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (set_hwpoison_free_buddy_page(page))<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 num_poisoned_pages_inc();<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 }<br><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">And, this b=
z still exists in the latest rhel7 kernel, I will open a bug to RHEL7 produ=
ct.<br></div></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gm=
ail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></di=
v></div></div></div>

--000000000000642c37058cd295ba--

--===============0336046696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0336046696==--
