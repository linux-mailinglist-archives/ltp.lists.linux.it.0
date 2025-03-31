Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F15E4A75E20
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Mar 2025 05:19:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1743391196; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=U1yVaeTPVLNWYtCLDk9hGO81+MuPByVmnAlHHQqfGKs=;
 b=g+gTtu8e9/+/wRKqEN0b/ypIwxJu0uVlh/dxSFF/ALDoaEHP6ExrwRt3xsZg4U0SNn8m6
 04m3ogDgwAUopFvOWZlmbI9BiDHKpeMkUe+/IV2O4CKZmX67zEyynzOjdX1ztCpGaxu/Du6
 07GC+I33xX7vHG4syz7JrTNiHGFmGQY=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7BE183CA833
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Mar 2025 05:19:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 309253C1D37
 for <ltp@lists.linux.it>; Mon, 31 Mar 2025 05:19:53 +0200 (CEST)
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5918C1400F97
 for <ltp@lists.linux.it>; Mon, 31 Mar 2025 05:19:52 +0200 (CEST)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so2150093f8f.3
 for <ltp@lists.linux.it>; Sun, 30 Mar 2025 20:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1743391191; x=1743995991; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=00WFd8XNQxCZwVDEBzmaXNicwzDR7Qy8cVmxBKC5/Ko=;
 b=GoIGCLmg+iQ5u4qbZCqOzPWxvA92xGpEt3Lg5Epc5O6zJbwS1MThpvmUJDaTxdgANt
 SAO/E5HQVuuV0rUSSJZmsluozL9WnjkTVal47R6JoQqs+6SgCGtDQNjpEb2V+2Vr3HOA
 YDY+aefVWZWt14UA7NQsafD4flvyOvUcgK8uWjPDDQtEoQXj1ZUEBIkro0oUHyaMHoTT
 UTtkDwRPrrdbxfwS3+pZnnGpHPGDgEo5q7hc6RypPyKHe10obFxkp5u/sTLRHMjLEaU2
 YXZLp5SP0FATN75YeHJwz1kHu6794QTCQgWz1lZv4zRvj/45yD1T7BFrKYt6mYeN3PpA
 oDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743391191; x=1743995991;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=00WFd8XNQxCZwVDEBzmaXNicwzDR7Qy8cVmxBKC5/Ko=;
 b=VwFkYVQpnDnQRP7FvRX55HUEw8uxGnwMq5Qo9P5Hnyh1GbxA5O2hRR40YXRHDV0Rsk
 bjBzwxyUdhXE0E/d6TJpqfS95qdFXkS6T2w5sTAJktI/cMgTfa3M2lHGZs1+82281GWr
 NB1MbTtMUIkH0HYt1utogBbc8fJQOLMF2kcf86kt6INumyGtwj4kk4pSn26KejHB1LtB
 bybL3wUv258wtOjrQV9OzrHKArAcDBPr/P7jKxahnA2z8gxy0t6Z3Vv3HV6YRDtwgL17
 Q3M5i5frumk2N8YxtzyxQPkvKH9rvgYjK+paQ5uc1fs+4XNv2+WLHepwEDVi+GznT86Y
 z48w==
X-Gm-Message-State: AOJu0YxFS5NzIaiYag5yrY15TKbLfkGGDIF7SbxBEAjhSXyXV8julN5D
 sLBDnfpj8wITY+Q4E3XnUEj2GrNP6tvehbmt+AD6FOpCp5UpqRBddjtscqPp5z1I9ajHyi7UMEw
 TsSZ1
X-Gm-Gg: ASbGnctMLVjVG43AaIxS++2Jr+QzdVysIzJQrxQeJ12GWAIX2swnl6T2lBVriuOZmHR
 sZjqliQMMdDmav6oTpVJaECuZpUmbs8Cn3lButhGRi8WB0csZQ2n7HvCKIMk2vBmJ4NYA2H5JCc
 BLsdW+4luTbNHfs8c4g1MAf6cpl+cPT7vEAA1Y6pxf7R6HlEKvTrVXMMHByf+217paKs2VudeDI
 EsVz8wAnUZ1jIgQgZ3O04PCagw3E1rqDZTP47rKE2nqlss5fFqgSIjqyiQYpmZdIsWm2lh7/Dal
 f1/UjZd91voANUI1HKx3AdN5eMbRw+tQyg==
X-Google-Smtp-Source: AGHT+IFaLvLyPaCCGCagww2bZToyN7HXOMR6kAVUWpvgVgDZTV7Cm6u53z+Ii6ijdaA1sIehJ4z+ZQ==
X-Received: by 2002:a5d:64ec:0:b0:39a:ca05:5232 with SMTP id
 ffacd0b85a97d-39c120c7ccemr5230643f8f.5.1743391191407; 
 Sun, 30 Mar 2025 20:19:51 -0700 (PDT)
Received: from localhost ([202.127.77.110]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c1845e66esm3949553f8f.18.2025.03.30.20.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 20:19:51 -0700 (PDT)
To: ltp@lists.linux.it
Date: Sun, 30 Mar 2025 23:19:43 -0400
Message-Id: <20250331031945.5948-1-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250328075958.7616-1-wegao@suse.com>
References: <20250328075958.7616-1-wegao@suse.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v9 0/2] cpuset02: Convert the test6 from
 cpuset_memory_testset.sh to C code
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Changes v8-v9:
* Remove .needs_cgroup_ver = TST_CG_V1, let case support both v1 and v2
* Remove cpuset.sched_load_balance knob 
* Update base Li Wang and Petr's improvement suggestions on v8

link to v8:
https://patchwork.ozlabs.org/project/ltp/cover/20250328075958.7616-1-wegao@suse.com/

Wei Gao (2):
  cpuset02: Convert the test6 from cpuset_memory_testset.sh to C code
  cpuset_memory_testset.sh: Remove test6

 runtest/mm                                    |   1 +
 .../cpuset_memory_testset.sh                  |  37 +----
 testcases/kernel/mem/.gitignore               |   1 +
 testcases/kernel/mem/cpuset/Makefile          |   5 +
 testcases/kernel/mem/cpuset/cpuset02.c        | 140 ++++++++++++++++++
 5 files changed, 149 insertions(+), 35 deletions(-)
 create mode 100644 testcases/kernel/mem/cpuset/cpuset02.c

-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
