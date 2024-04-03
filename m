Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BE38962F0
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Apr 2024 05:29:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1712114957; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=4z6odbpQcfUq9NWxkTE5/rYAA1uw0yWY9kSbXYevx6o=;
 b=S3pHRO9o90IT7oJer2wHntiya1NhAO+c18s8XPIystj5QQGqdTjsh4kZ1LGuVhlzLgz87
 rYFkw3boeeNGzw/YKHwHXZzzo4a0tgrgc7pBVA5QlCYtIMthzB0rufjABnpKh6EfmoG3g8T
 0SDVBCquggJk5lXfyrGTI5HihNm99Qg=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8F8F03CD0D6
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Apr 2024 05:29:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 274463C74E7
 for <ltp@lists.linux.it>; Wed,  3 Apr 2024 05:29:08 +0200 (CEST)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A72F5601FC0
 for <ltp@lists.linux.it>; Wed,  3 Apr 2024 05:29:06 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-416244fd0a2so202435e9.3
 for <ltp@lists.linux.it>; Tue, 02 Apr 2024 20:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1712114946; x=1712719746; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GJEFcLfQJsneeNX/pfA67osj7Ddeia2Pv9MA1bb+bFI=;
 b=OPyLdVAXIHLG0o/K0UBuayrHlQjWYIi5ZPsWZs+WqholXbN5LFfmPJu/Ns64C1zf4K
 bHbeu8zWEZYIGO+gyk9BWBFWD5myla8D+rOUKmqp4vjn1fUhba8WleaOmcN30Y0M3qPf
 KchfGqjbTcPU0a5La1RCQ1JwwEMq/Uz+oEuJZh7YF3kpbvpEF9gOhXvPEAHtgOB9YdR2
 FpUIHgRugTQJZ90HuBHeURog0KCzhhp0rmvQmjdL5elCf3kqDxqbePnwCeKSrcNFFOhR
 Hrd7kziZ4h8Jp635lIxSVgJPQyMr1j0pJt0Kd8RniYispZxeDymwmAW0YRp2QJcgYD9h
 1Wow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712114946; x=1712719746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GJEFcLfQJsneeNX/pfA67osj7Ddeia2Pv9MA1bb+bFI=;
 b=JLYf70lVphHaLPHD53wo8028hE+/9FdAGnSZgRTcB+ypFwf1/FKHyrWZKlYey+MJNH
 KZI1RjmwasjKYLOHxoxIu5haRXFYp1ZeSoQogNsDGn/mSFTS7ifOH8CJVFOvb1JQforA
 i+vCQzIZiBer53yU45emPTGHf9y7cJ1o36DVkAqH1jEUQJXKQ4XT0HdqLCwVrL9DsAA0
 PBp9WUnKgMTYbNBbN0fohwIsdWUS552nkY91vFVvj+Wi6OxpOrbPzcdnHvis5ku1WEoE
 fwFu5Ut1SnBqMrWqaATknp2cCq3tVxl7KMHkeTiEbXoHLGpRAyd/cbR5w3n99U6IhkJS
 umRw==
X-Gm-Message-State: AOJu0YxI6P9JJXjANPTYFvkIVJda2BsnTG8IN8zpf5Ym1eSItdtCXXNj
 0r6Xdj2IqwrOS+8lDAf3Qf1J+pIsgArcXzlDd2TpNHL/GfpIO/2Adcce0s4RDDyvb+VmFikq7fA
 =
X-Google-Smtp-Source: AGHT+IHDnIRWYRJqDBg3WH6gFrzFp6aG4egck+l5R4zyqpW+lfS+oi2Ny2EqyMDdUqDKLkfgiSSsrg==
X-Received: by 2002:a5d:510b:0:b0:341:c775:68b8 with SMTP id
 s11-20020a5d510b000000b00341c77568b8mr9928655wrt.57.1712114945753; 
 Tue, 02 Apr 2024 20:29:05 -0700 (PDT)
Received: from localhost ([2a07:de40:b240:0:dc1a:df90:dc1a:df90])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a05600016cc00b00343900398e6sm761001wrf.55.2024.04.02.20.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 20:29:05 -0700 (PDT)
To: ltp@lists.linux.it
Date: Tue,  2 Apr 2024 23:28:56 -0400
Message-Id: <20240403032859.3826-1-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240327034923.30987-1-wegao@suse.com>
References: <20240327034923.30987-1-wegao@suse.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v6 0/3] lib: TST_EXP_{FAIL,PASS}_PTR_{NULL,VOID}
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

Wei Gao (3):
  lib: TST_EXP_{FAIL,PASS}_PTR_{NULL,VOID}
  shmat02.c: Use TST_EXP_FAIL_PTR_VOID
  realpath01.c: use TST_EXP_FAIL_PTR_NULL

 include/tst_test_macros.h                     | 61 +++++++++++++++++++
 lib/newlib_tests/.gitignore                   |  1 +
 lib/newlib_tests/test_macros07.c              | 61 +++++++++++++++++++
 testcases/kernel/syscalls/ipc/shmat/shmat02.c | 15 +----
 .../kernel/syscalls/realpath/realpath01.c     | 11 +---
 5 files changed, 125 insertions(+), 24 deletions(-)
 create mode 100644 lib/newlib_tests/test_macros07.c

-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
