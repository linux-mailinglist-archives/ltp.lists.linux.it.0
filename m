Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F6E375F04
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 05:11:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 616593C74E1
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 05:11:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 207533C56D4
 for <ltp@lists.linux.it>; Fri,  7 May 2021 05:10:56 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 76C7F1A016E5
 for <ltp@lists.linux.it>; Fri,  7 May 2021 05:10:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620357054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yxX9l8Ds6CcfYGGUvQ3Fv/kvZFU+E1u7rA5aUXNdrNg=;
 b=ElS0TePoBkxDNT9/eukPfDDgcIGzU0hiUm5ZGqX3C6gRUsCgb0Ic2wuqBuF6j6K/9RthdU
 BJd2JtCk9y5m+IrWYFIX24jT3hnl5L4FcBlGbUJ9J32q7QSBffuKqcPAhIbFBElTQSl5Zj
 bcq9MDD6auTb8clSS22+VsQi4WPwuaM=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-r_lLsct_M1q8O0S8s3uGLQ-1; Thu, 06 May 2021 23:10:50 -0400
X-MC-Unique: r_lLsct_M1q8O0S8s3uGLQ-1
Received: by mail-yb1-f199.google.com with SMTP id
 r2-20020a25ac420000b02904f5a9b7d37fso8404696ybd.22
 for <ltp@lists.linux.it>; Thu, 06 May 2021 20:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yxX9l8Ds6CcfYGGUvQ3Fv/kvZFU+E1u7rA5aUXNdrNg=;
 b=HcpIjpNflVZcFmFrhhnGuX0GlmxN/9W1KNReTcxG4wIvjGuzclPbiDwtFO1YrMFXvh
 t8eSr/Tb89i4H69Hr2nBOzVKGTTpjREhFu6pD29I+h3EXiuD6GvTFpyCRuRYl/2FyMj7
 OhA6F9/xhFl+1u0J2RJthkE90Zs8frmlkoGe2xf9Cn8jmgX8Z8Trmy8uKPzr0kXlcJgG
 8yoydgsJAeoLuGETOJT1IHgJ0oHSWcTF+48CPekXlAiyP0RiFGR24xNYbE8gxvKdlpmG
 gpt0o98STtr9t0JWjs4fYjJ1HoQ40CFEtFj63iziLIurreX5XVAUHJODGxjdfIj/VdIy
 FQuQ==
X-Gm-Message-State: AOAM530KXmLwglhBMNlkteFTPQJgjdw8sT/TdaFPQyGbwn9DOJ3zUHA6
 jsKDHBymvaIJu+6teNFXw+SpAv3EW2ppwhBeO6lR5tnVtjwUQW5yic3/ye0w7XE7s9MtCQa4a2y
 w94fwleEQfN3BeggC/7wpcUku0AE=
X-Received: by 2002:a25:b44d:: with SMTP id c13mr10549853ybg.86.1620357049835; 
 Thu, 06 May 2021 20:10:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHqPGZPXCNJGQ1x7GJVJRzMODc6Ykhh5Kikgqig9eTwelUMhW+zzhIXUL8ukFrbtU9WmhdYXI89uWHGmmW3Pg=
X-Received: by 2002:a25:b44d:: with SMTP id c13mr10549841ybg.86.1620357049689; 
 Thu, 06 May 2021 20:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <YJOYgZNL7/qp5YCN@yuki>
In-Reply-To: <YJOYgZNL7/qp5YCN@yuki>
From: Li Wang <liwang@redhat.com>
Date: Fri, 7 May 2021 11:10:38 +0800
Message-ID: <CAEemH2dPMc+XoOXokm6K9w07QK2p-y8ZWOiwbQRAQGLmnhMkmg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
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
Subject: Re: [LTP] LTP Release
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
Cc: Liam Howlett <liam.howlett@oracle.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0504877332=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0504877332==
Content-Type: multipart/alternative; boundary="0000000000005b3ffc05c1b4c681"

--0000000000005b3ffc05c1b4c681
Content-Type: text/plain; charset="UTF-8"

Hi Cyril,

I vote to fix the brk02 FAIL as Liam suggests way (just removing
'PROT_WRITE|PROT_EXEC'), but I'm still a bit hesitant if that's wise
for the test, or we can leave this problem for a long time to investigate.

https://lists.linux.it/pipermail/ltp/2021-May/022474.html


--
Regards,
Li Wang

--0000000000005b3ffc05c1b4c681
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Cyril,<br><br>I vote to fix the brk02 FAIL as Liam sugg=
ests way (just removing<div>&#39;PROT_WRITE|PROT_EXEC&#39;), but I&#39;m st=
ill a bit hesitant if that&#39;s wise</div><div>for the test,=C2=A0or we ca=
n leave this problem for a long time to=C2=A0investigate.</div><div><br><a =
href=3D"https://lists.linux.it/pipermail/ltp/2021-May/022474.html">https://=
lists.linux.it/pipermail/ltp/2021-May/022474.html</a><br><br><br>--<br>Rega=
rds,<br>Li Wang</div></div>

--0000000000005b3ffc05c1b4c681--


--===============0504877332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0504877332==--

