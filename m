Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 708532AB37D
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 10:23:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1BEDD3C2F73
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 10:23:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id B4A673C1876
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 10:23:47 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 2F7701000417
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 10:23:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604913825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Be//ns5aIO86xHiTTL/2yk78S5AaXk8RZJHhQs8Ah6I=;
 b=hOpzGQohhSTPivWO1EWlWhWi5++OBBD9eOXuWOClAwVihVY8wDrwQVeP30U20/ZlTEKvPa
 StoCOkNceZl4PtGNHeO3fhdhFvFPe6DSOBac+YndEZ8RMhaNA3RYgcI7mP0lKnddEzGq3F
 2/Y0f3dj7BvvbcXMZIxdHwbxCNryuOI=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-aOLszOyYNJS7D0YZBMmjZg-1; Mon, 09 Nov 2020 04:23:43 -0500
X-MC-Unique: aOLszOyYNJS7D0YZBMmjZg-1
Received: by mail-yb1-f198.google.com with SMTP id b189so10339721ybh.5
 for <ltp@lists.linux.it>; Mon, 09 Nov 2020 01:23:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Be//ns5aIO86xHiTTL/2yk78S5AaXk8RZJHhQs8Ah6I=;
 b=bXTMojXCczjgkBMOjIbXQXsuDqIvukjnLwvfvZvzv/OV0LwUicOtITvOxdX9usehhO
 hldJiNkbPEwsadnuKKjzsVCk94eniEW3w/OUtyOhiH1kuDS55MBfXmNkyQFe/GpsYbJ3
 cCndSGD7fchOpZaktFQ0cgv9d19adSdUXdx9v6B1MxvAzigixX6qdO0MT2uEH6vV6jTJ
 TJPMkN8KZM5iIBtmU05ue2IgHj17zEQAWjOxe2MlJ86w9Gmr4chnzGv2Ei15I3wpzFnQ
 Cb7uXWjXdcQSjpEiTgfDuAjYaTFIbr+S1I9mvHjHH7jR69xRufk5sZ0VYwJh6gdJbCq5
 SVzA==
X-Gm-Message-State: AOAM531oN3Ba24p0U0KwXR8Lklu/C+nQoPW88iANEAojBcgKwmos0US7
 PVDO4oNPJnxxR7ZHoIYS5LlFLFze5vJG7LISwMXaZ+sR7ybWjtzTeE+PsevqphvgjlHnkBXaalS
 nRDcKSQv8JODj3aztsi9CBpRYSrw=
X-Received: by 2002:a25:ba4c:: with SMTP id z12mr16945593ybj.366.1604913822452; 
 Mon, 09 Nov 2020 01:23:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFCSVuCkzYMF3Y4+DHwxc4Wgm6ubw5kY70F4A+Cfcq7MHifW+tBkKjTup+IKO8TLfbHv1tBe5T/rG3JHjHxZs=
X-Received: by 2002:a25:ba4c:: with SMTP id z12mr16945577ybj.366.1604913822203; 
 Mon, 09 Nov 2020 01:23:42 -0800 (PST)
MIME-Version: 1.0
References: <5d6e978c803e4e6449cabd89596729bfad996a17.1604408825.git.jstancek@redhat.com>
 <CAEemH2dHXYbmkbzccWNurYURZQJJ4GENRBr=6KfQaL5HJaBO2g@mail.gmail.com>
In-Reply-To: <CAEemH2dHXYbmkbzccWNurYURZQJJ4GENRBr=6KfQaL5HJaBO2g@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 9 Nov 2020 17:23:30 +0800
Message-ID: <CAEemH2f-okBCGktRfT5-RgkXziAu3FrFAN7Qih2vz=A9mfJzRw@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_cgroup: fix short reads of mems/cpus
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
Content-Type: multipart/mixed; boundary="===============0372372259=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0372372259==
Content-Type: multipart/alternative; boundary="00000000000044a0bd05b3a91e19"

--00000000000044a0bd05b3a91e19
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 4, 2020 at 2:22 PM Li Wang <liwang@redhat.com> wrote:

> ...
>> -       tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, "cpus", buf);
>> +       tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, "cpus", buf,
>> sizeof(buf));
>>         tst_cgroup_cpuset_write_files(PATH_TMP_CG_CST, "cpus", buf);
>> -       tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, "mems", mems);
>> +       tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, "mems", mems,
>> sizeof(buf));
>>
>
> sizeof() is generally used to calculate the size (in bytes) of a data type,
> e.g sizeof(char *).
> I think here to pass 'BUFSIZ' directly is better than sizeof(buf).
>

Jan, do you agree with this point?
If yes, I can help to modify and apply this patch.

-- 
Regards,
Li Wang

--00000000000044a0bd05b3a91e19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Nov 4, 2020 at 2:22 PM Li Wang &lt;<a href=
=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">.<span c=
lass=3D"gmail_default" style=3D"font-size:small">..</span><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, &=
quot;cpus&quot;, buf);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, &=
quot;cpus&quot;, buf, sizeof(buf));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_cgroup_cpuset_write_files(PATH_TMP_CG_CST, =
&quot;cpus&quot;, buf);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, &=
quot;mems&quot;, mems);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, &=
quot;mems&quot;, mems, sizeof(buf));<br></blockquote><div><br></div>sizeof(=
) is <span class=3D"gmail_default" style=3D"font-size:small">generally </sp=
an>used to calculate the size (in bytes) of a data type<span class=3D"gmail=
_default" style=3D"font-size:small">, e.g sizeof(char *).</span></div><div =
class=3D"gmail_quote"><span class=3D"gmail_default" style=3D"font-size:smal=
l">I think here to pass &#39;BUFSIZ&#39; directly is better than sizeof(buf=
).<br></span></div></div></blockquote><div><br></div><div><div class=3D"gma=
il_default" style=3D"font-size:small">Jan, do you agree with this point?</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">If yes, I can hel=
p to modify and apply this patch.</div></div><div>=C2=A0</div></div>-- <br>=
<div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<b=
r></div><div>Li Wang<br></div></div></div></div>

--00000000000044a0bd05b3a91e19--


--===============0372372259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0372372259==--

