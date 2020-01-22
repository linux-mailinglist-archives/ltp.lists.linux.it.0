Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A2C144DEA
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jan 2020 09:49:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99A2D3C23AF
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jan 2020 09:49:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 2C6C03C2360
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 09:49:25 +0100 (CET)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 494C814019E5
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 09:49:24 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id t14so2664662plr.8
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 00:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6oGGjmdpqlCnj210BMozlp/1jvOSj4N/mLyz4h5AhqI=;
 b=QSaPJ31teFgiHqz1rkEKXz5/oV2XBElV3OiJtlbDCFQppgUDdGVAV71SUhFJ+AwaIL
 rCJNg4bpJvOEMHHIS4vPYGJQbfKKtq9WCuv4Bhk/V29VJOUB1Q0QRe0chW6gWriJzCos
 w7QlZDDCr2yDkIopP2V+2dV5w2tHcxIPW/M2tvw9GmWcelH8GeoiDW8e8iYC68WfwQsf
 zZpOj8PBCvrR19v0URdUgh28DR6hYYpCGYDDJrbVz7d+T3sUiNF9eLGRsArsNEstlRRa
 eufXFgGpNocxIDcAnb1rO+8I7n+rrvjjdvRZG0uVvSvCEcKY/knofebQwdZnfACPZjO4
 Y+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6oGGjmdpqlCnj210BMozlp/1jvOSj4N/mLyz4h5AhqI=;
 b=dfuz3h4qSBIeCn3tnxYMW77Oql3EpP+Qi1YJLLgtcDQXsaQc0wW9ek/EfJvwD8pYnF
 zGC5elJMNjroroBURkFRKzAfoBH6UyQ3yUHwbhbH45IZLvCn9MgwEvb5ONpuKM5PvBBI
 LV/xE5aSIAXBuyHVJrvsXleQQBZCiObbTbt1Q6OJcbmC5gBj+Xr3pJUuDSr5X0yqQh0W
 WzNkpU/bIZOuIOcdh2iRh+bpHiiIxPd086K/dVRA07CBS/EwXElT+ZfSqCSImdSgwulx
 GcLl3idlQJFtQnM3JRIkY/Jqr1tr/5oA+WdIIh+fNtaGbdXOPyYq9mIgKuD2ksjnDddZ
 gwHA==
X-Gm-Message-State: APjAAAVWy+S3lQUUjXOK9T/jleK1MSWFdhGb4sl6eON+RWmkljyh9dFc
 oLfHyx/8mj3WnRcWZ/8BJCnQg+zMk2Q=
X-Google-Smtp-Source: APXvYqwsn1C54rqsIMipH8qcB2n/Y6GWL6lV3fB5Uu4gCYEppthGxadgg023XHPSCQj/EDPcFxsevA==
X-Received: by 2002:a17:90a:fc82:: with SMTP id
 ci2mr1769151pjb.13.1579682962095; 
 Wed, 22 Jan 2020 00:49:22 -0800 (PST)
Received: from localhost ([122.167.18.14])
 by smtp.gmail.com with ESMTPSA id c14sm46307116pfn.8.2020.01.22.00.49.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Jan 2020 00:49:21 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 22 Jan 2020 14:18:44 +0530
Message-Id: <a9f84c70b1044e863456ef0cfbc7e0d292298ff7.1579682844.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <b4026c746a164c83636ff14d77bd0638b1cd5407.1579669956.git.viresh.kumar@linaro.org>
References: <b4026c746a164c83636ff14d77bd0638b1cd5407.1579669956.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH V2] gitignore: Ignore swap files
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Update .gitignore to ignore .swp files.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V1->V2:
- Replace .* with .*.swp, as .* also ignored all .ignore files as well.

 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 903d616b11c4..86d8190a3a65 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,4 +1,5 @@
 CVS
+.*.swp
 *~
 *.o
 *.o.d
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
