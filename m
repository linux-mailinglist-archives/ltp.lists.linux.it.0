Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 340B8444FF5
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Nov 2021 09:11:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC1603C72A7
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Nov 2021 09:11:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AE1A63C704D
 for <ltp@lists.linux.it>; Thu,  4 Nov 2021 09:11:01 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 365B4140163F
 for <ltp@lists.linux.it>; Thu,  4 Nov 2021 09:10:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636013458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hfrNXduHW8UQPbGyqErruc87ZPoPRoKMbfYNP2ajjgU=;
 b=HWb50524lgvlIR8oIekkkwIL2ZpMWi0amayaHwH5EnIbuhxywK3p20JPJBs9hyWUD2vhKC
 U6IGtlqJGtKG2h8qjJlnjK4nyOLQTxrubkCP8DQAQLar3XKoyOSA0jEDNAqL4qnmvSCo4a
 gF4Mhch36BDfiHg1W36KFTV0FvLFTf0=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-8jF7VdvwOxGejvw_BQB6KQ-1; Thu, 04 Nov 2021 04:10:57 -0400
X-MC-Unique: 8jF7VdvwOxGejvw_BQB6KQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 g36-20020a25ae64000000b005c1f46f7ee6so7676500ybe.8
 for <ltp@lists.linux.it>; Thu, 04 Nov 2021 01:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hfrNXduHW8UQPbGyqErruc87ZPoPRoKMbfYNP2ajjgU=;
 b=k5bS4TjxzWYuiU9fHHjLTOwqMAurIP4I4lyu/8eh+ChqExfmZY7FlCCZY3QNW2yNCz
 lnL0cTZEPC97tSlhl8Ye4qiu81ApQKFKNAYCH2f4e7x1loQdtQgbQXXU0/AHagB4TVN6
 ARQi26ykiGwsPyMlj60sSIt8bLNsZsg9lFywC7NJNkf+USrH9tk0rJafmipRr5pX5/IF
 6qrUiBzkRhh1qZM0bS56Ig5I+KCl1MC3ASJYo6GxXgL9QpKqR6F0vr9k7+rdsegpiZRc
 odCyOxaoOwCHcHCuAJ99GDrkZZEt4XmOPEfDVh96nRwLCxzTIEHIRJsGVNkLcqZL0D3V
 lR+g==
X-Gm-Message-State: AOAM531xHcOLIww1gczjTUNpYqcN+65a5/bqBEwYbHrhpY7Cgxt79Y9M
 9WIK6Xk7XJHbs+ZD5eSgnFZTRhKAS12AF/9+sB9JaaCWderui9S8Q9v2m5WXv9OuNoaLzwAGQ/L
 hMMhsmvXti5HIVLHLVE4SC97qf6I=
X-Received: by 2002:a25:aa43:: with SMTP id s61mr40916609ybi.186.1636013456874; 
 Thu, 04 Nov 2021 01:10:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx71CaxDPeAE/H1hQs5CqqBvH8MYkmBa40BiqOJGCm0nN6JFzHj+InMX9awx211Uf79W5HsRXRDFiRndRuPBUg=
X-Received: by 2002:a25:aa43:: with SMTP id s61mr40916585ybi.186.1636013456653; 
 Thu, 04 Nov 2021 01:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211104080445.250030-1-zhaogongyi@huawei.com>
In-Reply-To: <20211104080445.250030-1-zhaogongyi@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 4 Nov 2021 16:10:43 +0800
Message-ID: <CAEemH2ekH_EpyWeF5ha6zt3gg-cKgH3rpe0J4v6Fy0uG4-Ma+g@mail.gmail.com>
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
Subject: Re: [LTP] [PATCH] fs/doio: Bugfix for doio.c
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
Content-Type: multipart/mixed; boundary="===============1291980546=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1291980546==
Content-Type: multipart/alternative; boundary="000000000000ee973105cff2107d"

--000000000000ee973105cff2107d
Content-Type: text/plain; charset="UTF-8"

Good catch, merged.

-- 
Regards,
Li Wang

--000000000000ee973105cff2107d
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div dir="ltr"><div class="gmail_default" style="font-size:small">Good catch, merged.</div></div><div><br></div>-- <br><div dir="ltr" class="gmail_signature"><div dir="ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000ee973105cff2107d--


--===============1291980546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1291980546==--

