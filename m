Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5273817EEDE
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 03:53:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E3D6D3C6162
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 03:53:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 8BC033C613B
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 03:53:32 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id EDFEB1401A5C
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 03:53:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583808810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2nqZYsheq4Bf1UsIdg1LI3/RAaGJwpwhmUG/NMta7c0=;
 b=iWgWJ/o5jg1FW0GsdF3MnJsu96aozy7hdmYDwhJLX/SD5pmUrv3fw4KyKS73KJyZzMsTDv
 qCKIC+3U+hrXwQjVbLIusWSQxm/CMku9UxMWUkgD3LvQEMtTCKGL83aJiLo5sgNU46HIP8
 GrTA+gACzluLH5jJHdwjpzEvjePP4E0=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-kK9Ts2MyP4WKNJJ_n3YbGQ-1; Mon, 09 Mar 2020 22:53:28 -0400
X-MC-Unique: kK9Ts2MyP4WKNJJ_n3YbGQ-1
Received: by mail-lf1-f70.google.com with SMTP id q4so3578112lfp.3
 for <ltp@lists.linux.it>; Mon, 09 Mar 2020 19:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=c1rNxRVwdoEQp1I6TPbnHgg9cCMFgEZkAz9+UhKlu7s=;
 b=GkeipmMPjpROaouuKSmevhDRkOy46zNhUpeSxKefRJ3Voxk31vYo3AgTGQJxIOoM9H
 IoMV97/VwRS0zuqD7qy78shrlhtvoQU+oAkdYEFi4eA8Dk2KVNhdTz4Z5Td2ifalqfvG
 1SUxUsCxmPUhqtFF4ix2eoOj2dbX+jUfMy+vre0SReBKQR0aojQZF97oppdYv+kH8EC9
 UPW3csDbaQONh51M+N6tC4VHMp87vUeCREhvC+jrPpMmHCp9GO7gAm0Km5Po9O+U/cGA
 x+jkJ46+GteCRM98B0VV3rVzAP970nnPafjfLuxjj/CB+jdpSXZo/o5utNLy630Ntltc
 ds7g==
X-Gm-Message-State: ANhLgQ3eSn+7mRbYpeFbn+oqdj7I3gg2SkBmLToD+vxdaIzgX7F/YIZo
 JrivR1sJ8IpPQy08vJK4brPVvNo4vHmf4w6/7oYo5oAsl95Z0RdT2gTdDZHSaAX79qeJJCawcXF
 fs7fNVi3mVftUfVlQz8ok8oLzIyA=
X-Received: by 2002:a05:6512:3042:: with SMTP id
 b2mr11362659lfb.36.1583808806550; 
 Mon, 09 Mar 2020 19:53:26 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvVVbrAWxX9sxH2EvKmnsW2CtQ7A3tNS/mRrW8HpfzJZ/bDAId2Fr4sESw1qqloncWOxFyVG0+Cr5N0wt8apTA=
X-Received: by 2002:a05:6512:3042:: with SMTP id
 b2mr11362656lfb.36.1583808806359; 
 Mon, 09 Mar 2020 19:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAGR3Yi6r+caUYV+yZYHGsuRUPQBbpsN_PJOTTSvHwE2VARy92g@mail.gmail.com>
In-Reply-To: <CAGR3Yi6r+caUYV+yZYHGsuRUPQBbpsN_PJOTTSvHwE2VARy92g@mail.gmail.com>
From: Ronald Monthero <rmonther@redhat.com>
Date: Tue, 10 Mar 2020 12:53:15 +1000
Message-ID: <CAGR3Yi5dVfMwgBEUcOkXMNr4eX5=EumXi6PU_mqLo_MRZ0XkkQ@mail.gmail.com>
To: ltp@lists.linux.it
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] Fwd: Fix build error because of undefined CAP_SYS_TIME
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Details of the build log at pr#654
https://github.com/linux-test-project/ltp/pull/654

Signed-off-by: Ronald Monthero <rmonther@redhat.com>
---
 include/lapi/capability.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/lapi/capability.h b/include/lapi/capability.h
index 8833f0605..8ed68bfce 100644
--- a/include/lapi/capability.h
+++ b/include/lapi/capability.h
@@ -24,6 +24,10 @@
 # define CAP_NET_RAW          13
 #endif

+#ifndef CAP_SYS_TIME
+#define CAP_SYS_TIME          25
+#endif
+
 #ifndef CAP_SYS_ADMIN
 # define CAP_SYS_ADMIN        21
 #endif
-- 
2.21.1

---------- Forwarded message ---------
From: Ronald Monthero <rmonther@redhat.com>
Date: Tue, Mar 10, 2020 at 12:44 PM
Subject: Fix build error because of undefined CAP_SYS_TIME
To: <ltp@lists.linux.it>


Details of the build log at pr#654
https://github.com/linux-test-project/ltp/pull/654

Signed-off-by: Ronald Monthero <rmonther@redhat.com>
---
diff --git a/include/lapi/capability.h b/include/lapi/capability.h
index 8833f0605..8ed68bfce 100644
--- a/include/lapi/capability.h
+++ b/include/lapi/capability.h
@@ -24,6 +24,10 @@
 # define CAP_NET_RAW          13
 #endif

+#ifndef CAP_SYS_TIME
+#define CAP_SYS_TIME          25
+#endif
+
 #ifndef CAP_SYS_ADMIN
 # define CAP_SYS_ADMIN        21
 #endif
---


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
