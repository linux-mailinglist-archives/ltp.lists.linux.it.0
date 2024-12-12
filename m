Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 144E09EE1D8
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Dec 2024 09:51:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1733993479; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=4N383YA+Um3VA014DtxQ0k3UCIZSJQWSpejlQ3N/Nyw=;
 b=Ldk53AJATjStEtwL3HXYKuPI38FOJr5C4zUqoZdH6IFT6vpOinA8K6+iuBPktpBF2shvr
 azUw4tU39TSikLpdOxU8XQF60JbSn+2jhWN2pBu2gerQGs7fOgaTXP3nnwBwPd6E5oUC/gb
 7XZL9UyhNH1VGiy5ZUW1Hlc9q0I3POw=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F34263E7ACB
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Dec 2024 09:51:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 384F63E7AC2
 for <ltp@lists.linux.it>; Thu, 12 Dec 2024 09:51:07 +0100 (CET)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 870901400E06
 for <ltp@lists.linux.it>; Thu, 12 Dec 2024 09:51:06 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5d27243ba8bso588382a12.2
 for <ltp@lists.linux.it>; Thu, 12 Dec 2024 00:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1733993466; x=1734598266; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4E0pt57Jkexeh4a9REUcORCqSzO3y0/jyPPhJY/lvdM=;
 b=R1Z3r4OjvTrRy3P4NbfzRnfPr202j/gTX4HMB+0Fiyomnvnmxe+mvMgo4oIKxxxRuo
 qtHpkDjXJ7yvK5XDnz6POcL1xxk9uLBPU0YZ3gAY4dJIfQfO3vA+USJr5gC9/NBKX0Wf
 6MJagayTk6xBGcl1KRIhXdA8bi6JetWZbi4psbSHWO2FhljR5U4cB8u5mtLnqPbuI+WN
 nWaEwnHsSBI//o9Ul66XnTbWup4r3ewIZNtXBb60zp27yHoGtV+R0aHZm/vtYoakupjw
 AJ/dRHY18y2XACRBDvGozMrLukVqz88lD3RBhVeKpBtEkV20gkapd+5PVp+jBTB46eI4
 WO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733993466; x=1734598266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4E0pt57Jkexeh4a9REUcORCqSzO3y0/jyPPhJY/lvdM=;
 b=ckMxJuMwq7kuPRs5e+zqORslubJjmVVSZ2pHTGZx7TIPvGqyvRyim3N13Uv6ehOcu0
 3BjgzRpLXkCQC4LRFkwqHMp8FbRvOWijbgBk/DkygNEwJYZj3UenZxkvCCY3SyfZ5u1y
 32Z9n2Va/Ulig+99l9/b3i00a0fTEganBZen6UC46x1HUDxa01ziPIp68DO13Jp1iI70
 CZ4xYBzdHrT8qADE5CLFzVlAdpaOf6RkS/tzvNtTgTS6UB1v32ifN6YNPftI7aLnaQRi
 UR7Sv3DtKwAAzifQc6hZtA4nn4GU8MlndPtagr5GbKZNwp6fZ4G6Wxavo6jptVTiUmkX
 P0yg==
X-Gm-Message-State: AOJu0YzFuxgaKPQnUbwgLJc9COhboo3v7lm0OTDR7fqkypwgwSg9BAwy
 V+DlK/SOF0bw/j8FbfDgpQuiMhSE8/TZ/b3SuhCM9ThxReCjgig7MqhqAGSvKqifTN4K9c9p4Gw
 =
X-Gm-Gg: ASbGncvnSFlG0y6P8gMgotg7ehqYX54+8yN3AvdeCswcKXbcrTT1yLmvNTnMDXnJOSr
 YQXnukt1dcup9ElWIeTJfc6BNY2MbRBctuGMzYqvtardSl3Ji2D6yr/4m1or488kysMjnbQWD9Z
 gT6LBJWumGKyFfnjVpw/t33Xoek0B4KUxMQGNjlufpfhStNqMkIiA18J+f/uubBb1sz05IW/7Ik
 N8phLg6c0Af6cwur9+/zvlWIB3HZMLytFoGpVyFcSjXsQ==
X-Google-Smtp-Source: AGHT+IE1KOe3xBjE8lkxw1KCrwd8S/2PPhj8YLPZ7aNRSa1QSsJQXiE+1ZjOifcyTtFXB5x3FkWfJQ==
X-Received: by 2002:a05:6402:3818:b0:5cf:f42f:de82 with SMTP id
 4fb4d7f45d1cf-5d4edcd0f77mr275467a12.7.1733993465677; 
 Thu, 12 Dec 2024 00:51:05 -0800 (PST)
Received: from localhost ([202.127.77.110]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d4430123c3sm1146413a12.10.2024.12.12.00.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 00:51:05 -0800 (PST)
To: ltp@lists.linux.it
Date: Thu, 12 Dec 2024 03:50:56 -0500
Message-Id: <20241212085058.29551-1-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240415114652.22687-1-wegao@suse.com>
References: <20240415114652.22687-1-wegao@suse.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v5 0/2] ioctl_fiemap01: New test for fiemap ioctl()
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

Wei Gao (2):
  tst_safe_macros.h: Add SAFE_STATVFS
  ioctl_fiemap01: New test for fiemap ioctl()

 include/tst_safe_macros.h                     |  21 +++
 runtest/syscalls                              |   2 +
 testcases/kernel/syscalls/ioctl/.gitignore    |   1 +
 .../kernel/syscalls/ioctl/ioctl_fiemap01.c    | 122 ++++++++++++++++++
 4 files changed, 146 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_fiemap01.c

-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
