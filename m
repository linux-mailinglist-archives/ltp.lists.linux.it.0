Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B5DB42F4C
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Sep 2025 03:59:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1756951182; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=ESNd/oZqiqQHGrvm3Did8l/jfDFHlMnjyKCEp8JBvcs=;
 b=bT2Q6N3ZCoe+T9De49V9TMoEk4eQWbCJbbrz53ZrVS63a42jb5iKlUNfs8qMR1MOKa6zB
 z34iCQmLUim4vth+z/vxGigxSZNNn9krQ5MWPXfJr5fSivYIAFxrGiWjXrbJ/5So/wzFZGM
 nlZ4l5quXgCHCXshVpUHBQIuY5wB7DM=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F21D13CD3F4
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Sep 2025 03:59:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 40FB53CCF83
 for <ltp@lists.linux.it>; Thu,  4 Sep 2025 03:59:30 +0200 (CEST)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 003651000488
 for <ltp@lists.linux.it>; Thu,  4 Sep 2025 03:59:28 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-61ebe5204c2so693211a12.3
 for <ltp@lists.linux.it>; Wed, 03 Sep 2025 18:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1756951168; x=1757555968; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iamso6PV5kRt2MOp+XopCeb7wTGOtK9E4qZky7ynDEg=;
 b=Al5diFSELpy0MHADrpoq3uUjqMeM1rLhO4jxEt09RRJBIqOyYuBb1atyHitcFCEfjB
 gnSlCmV+Nq2mF6TkeM20W/ddylHGq1ltBrU6NfiIjLEV/BwoU9RUE4H+8FJH52mrFfLd
 a6Qz7mL7tz2X+HAKERbTZ9isZT5KiMZ7sLhLtBPWIY6F3C9kJOB361Pzw5j0c+aRVozi
 FTEnN2ghjuuSSfokYTEPMiZS8XTo9XkGnJUrgqcboCCTKadAxm/Z/hzDbHBRu6tmBHLL
 5OSi/jN1jrv8wASTxNAd5LunqdRkmQPu7q94gSixVLrc6IeC471AIBiNc26p/qPEnu0t
 2YOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756951168; x=1757555968;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iamso6PV5kRt2MOp+XopCeb7wTGOtK9E4qZky7ynDEg=;
 b=kj7mclEi+TEaYttIXg6uLJSbMw/QndIyWlgGXjoq1xSZ7p89caLCMNEttKW0pgWn76
 OOvL8EmvELSGaVSS7hVatPVPXVU7iaEdKq7jmWLzRj1n829qLKVyLQDd/OU/0Aii086E
 CsZMrzC0ZVBSVAwDHbSC4b5mEs+FQqIf5CHqVmqrbUiaRU7kMUg+EEAPHEKSYa80wiEQ
 3JDtOY9HGhaW+v5UBhnBRs2tFr3FWYR9buv9O44PD/de8asuGjVPRvLMMoIZPgK54ro9
 y/b8Kw8MOCTETbLaavxt2g7QDiz9Db+uPiblglJejqkxskXNrDdS0CaUebPSHUh+tWMW
 +stw==
X-Gm-Message-State: AOJu0YxdFGU0dr62hCzxDt0fLJ4FbDbjfqQaQqBgRNZ787BcNaIec/0x
 8t61VHfmCXD12Uyj7pNIzWPkequt1Kc9tumI5w5y5yU2xII6mzH0PwH5KSLGgnsG0PGJFK+e3yy
 hP5I=
X-Gm-Gg: ASbGnctHtmas6wSl5iAd+YZeje1h9veXFyHy7VwR0fK/9UfcBPQF6Tl3lmT0MGygbZY
 iuoRvt58XZ5Lzxwj7XXHjWHVR4PAAv6ggeOlM7fplBjosLQv+uTV6IRO9ge8WwJgxb7sdNYlCVB
 rucAJ9tRFGTVieaevRfb1o9L05cji9rV90ODgPNL6Y5PQbfDydNMHvCzm0bP+4n90ZhHMPrUMI3
 zDvooUeQp9LY1tGeC3EQUMKQe2qE9M2AQ8PJH6DbyEsp3FZxOcFa2bFM0wuXXPynydhwGYn9yPf
 JpDjPKdSNaJR+iO73aRaG2sg5nRqXXaXSUSjFI8zOHQIk3VgitAgUyzWixGP0AA7cnC/ZEWYuff
 tx/e5AO1JlZUaTylYiI+QrlmrTd8rfp+f9cfuQ145lKI=
X-Google-Smtp-Source: AGHT+IHEzLGYJZ2tlm+FTw7OCHT9xbiVJ657emp4PvZVXL8K+ppQda5o3SopoLgc1EF9jPUiH91L/A==
X-Received: by 2002:a05:6402:4407:b0:61e:ae59:5ef4 with SMTP id
 4fb4d7f45d1cf-61eae59734emr9685020a12.0.1756951168163; 
 Wed, 03 Sep 2025 18:59:28 -0700 (PDT)
Received: from localhost ([2a07:de40:b240:0:2ad6:ed42:2ad6:ed42])
 by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-61edc393dc1sm2541207a12.0.2025.09.03.18.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 18:59:27 -0700 (PDT)
To: ltp@lists.linux.it
Date: Thu,  4 Sep 2025 01:58:57 +0000
Message-ID: <20250904015920.7432-1-wegao@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250902135117.6222-1-wegao@suse.com>
References: <20250902135117.6222-1-wegao@suse.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 0/2] tst_test.c: Add hugepage check in
 prepare_and_mount_hugetlb_fs
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
Cc: Martin Doucha <martin.doucha@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Wei Gao (2):
  tst_test.c: Add hugepage check in prepare_and_mount_hugetlb_fs
  cpuset02.c: Remove unnecessary .save_restore setting

 lib/tst_test.c                         | 4 ++++
 testcases/kernel/mem/cpuset/cpuset02.c | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.51.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
