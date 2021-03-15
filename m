Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B678E33AA1B
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Mar 2021 04:46:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B9963C4E2A
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Mar 2021 04:46:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 02D973C2E31
 for <ltp@lists.linux.it>; Mon, 15 Mar 2021 04:46:37 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 121D31400071
 for <ltp@lists.linux.it>; Mon, 15 Mar 2021 04:46:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615779995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/czvb4YwgjRls+4/esr1SCE2yZvNGCMY9E9vIRh42MU=;
 b=PquHl1iarU+kL8jFCdS2h2KoorZNMWBK5SNaPeLDAH/nsTVATPm2C+s0LvtUBQxSKCUjOU
 pxyelK/IwgBkEkjNgbeEBZAEM4n2AAc9rxsy4HRc+gRPqCMbV12a8ilOplf1DiKgvhujUv
 /FNgSW7QMLi8afjz9w25QmWCeOGunNc=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-i2Wi0ik4Ofu-BWj1eouRyA-1; Sun, 14 Mar 2021 23:46:33 -0400
X-MC-Unique: i2Wi0ik4Ofu-BWj1eouRyA-1
Received: by mail-yb1-f197.google.com with SMTP id l3so37015345ybf.17
 for <ltp@lists.linux.it>; Sun, 14 Mar 2021 20:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/czvb4YwgjRls+4/esr1SCE2yZvNGCMY9E9vIRh42MU=;
 b=c4tjF6taq8uSxbvLvl8qFswFRvI8HhuCPE74T9S1MT+Wj/Mp8PXqhV6MsAF52OLnA9
 YdDYgYdXqfMQDkdJ4nccafOpWsW1hLQ7ba528PxMBGFrAuYi8TLyDbDivszLlhClMkZy
 4DNDtCCi38bsZZ4G89g9Ch9mZheOYv7WXZMJ5kF39+Kml2yhUzIlV9AtRkkFR4WT9naL
 0rVC/IMuKpmHSdW3nQhi9+iM3XXmLEHc7QHYnpQpE3Vg5kILh5hpr/r15H65UomZ9KLM
 O05M9qovrkneANiv2UUgovuP0eAPZBTN+Hpq7AEQrA/aOciOcQ6i9uuk11fpJpfR8MA/
 mKhw==
X-Gm-Message-State: AOAM5329UVM8M+mw1nmFXmt2nWWe2DckzNM7cdzSzkM0bOJWcQrjil8u
 3MwKcWNdJvKMVBk5C97xS+yXgXTSZJlxBNPAMq9/Mc4p06q/B5PKkvbqrK8iiHu1gjft3kjatpe
 IDLoZZ6WMWbc2bgDAyj6cRZ554xo=
X-Received: by 2002:a25:af05:: with SMTP id a5mr35934027ybh.86.1615779992675; 
 Sun, 14 Mar 2021 20:46:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuQJfrXbuSwb5gtWNmkbSOCai4+JuBwKawYuaYg2Qq22zVXHJ2jb6qKoTmKIe9LxoqOwEKBs8mbNQs4lkx/vk=
X-Received: by 2002:a25:af05:: with SMTP id a5mr35934013ybh.86.1615779992522; 
 Sun, 14 Mar 2021 20:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210315034242.27545-1-zhaogongyi@huawei.com>
In-Reply-To: <20210315034242.27545-1-zhaogongyi@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 15 Mar 2021 11:46:21 +0800
Message-ID: <CAEemH2e23mCfOUcaGPhk6tJS+-HrVBu9w4LwGX5CCYwSjACZbQ@mail.gmail.com>
To: Zhao Gongyi <zhaogongyi@huawei.com>
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
Subject: Re: [LTP] [PATCH] SPDX-License-Identifier: Remove redundancy lines
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
Content-Type: multipart/mixed; boundary="===============0762641415=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0762641415==
Content-Type: multipart/alternative; boundary="0000000000007d6ad805bd8b186e"

--0000000000007d6ad805bd8b186e
Content-Type: text/plain; charset="UTF-8"

Pushed.

-- 
Regards,
Li Wang

--0000000000007d6ad805bd8b186e
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div dir="ltr"><div class="gmail_default" style="font-size:small">Pushed.</div></div><div><br></div>-- <br><div dir="ltr" class="gmail_signature"><div dir="ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000007d6ad805bd8b186e--


--===============0762641415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0762641415==--

