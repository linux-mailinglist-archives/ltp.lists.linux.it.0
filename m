Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FA99E8B4C
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2024 07:01:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1733724085; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=/TH9JZ+5e9ZfhFOZdqV3JXTU4ZHO0P3WqtsT6VGBjXU=;
 b=PX51B2tU3H2B5eybxiRNf2dXw64MsiWFBr3GkYvnDeBPvNwRGn/yDJUskhbZQVQcVzy4Y
 ETF3acxYKPP/1LqbwwFT2bPgOMHqDfXPMzSDpFkClx4migcO1QmYBHia9Y/zSeyTuflhiXK
 qj9h+3rongWXY4KFUScMlV1o2CQDH4o=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CED953E2CF8
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2024 07:01:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9F1A43E2CEE
 for <ltp@lists.linux.it>; Mon,  9 Dec 2024 07:01:23 +0100 (CET)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DA07B1430B79
 for <ltp@lists.linux.it>; Mon,  9 Dec 2024 07:01:22 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5cedf5fe237so6233320a12.3
 for <ltp@lists.linux.it>; Sun, 08 Dec 2024 22:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1733724082; x=1734328882; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X5pRBECskmQy5dU/IxuA56pj2avMpqbb9T7QZqK+Gbw=;
 b=TIsW1/z/0Af+SnuBjEj3tOashLkRTG4AeeLD2LnLrUE1Tnv6OEAilchDOV+GvWGf/z
 l+eooOE7Zep3vb8z+QfetGsP34T9JWVAatYWMMlD7Snt8AkIlZLtuQD4HO3sQHUhgFVL
 ZyhRCf2zrNRxWlg23rlAtChvomOZc6kZqD7kNiQ2xEnBzuxAkib5zIfUDrgQG8V+pkmd
 FcVF/MjkbbqigmVsE/vsGzxLhGJcxJSH92Nm/egMOs41+nuDeNBLqH7ID+MBgUCCDuBr
 0x/PZ6XONwLPMiWqTz/KcxT/K8NLMYUCoCVGHYN+uzOnDpx3xBS4bBclI8ixArn7MyL/
 j43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733724082; x=1734328882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X5pRBECskmQy5dU/IxuA56pj2avMpqbb9T7QZqK+Gbw=;
 b=dnoKbgQOd6hOvblCJRJaU5X/elgR2/Y42AzIFOYcclLx4cm8PD3MLvB4Ffp2vrKIo4
 lBFc+N4Ks6shDobwBWPqsScZSOW8IuT1YFBERjf/VS3BAW8BoMe8SCEtBOC3F7AXGX8I
 Sj+KiPXSKEuAXSpU44e7aWdxhjZXH4Q87MEpyCccJGA4+jl/59qUab61P7VxcNBkEHNO
 liDYPNsUe5aNP5MfESjBMUUeF/uRdiWH7himtPh/x93alfU0T1qbZsFBSQcCOUoojOwv
 8OqvgtFtxbZVgnZwha/nAdnLsAQb1G6YXEJoC9j9D6SwBqamgkPl6aLac2sO0Xvd33jP
 mTOg==
X-Gm-Message-State: AOJu0YyoJAwDPtY1kCr7MjrKkFARng9GgDoFTgaQB7prE8HcKuHVvfRl
 mHvPl0Am7+9YWIDH3sdRmdciGi61toytOm9yXpCMY1vfvkMEd+OW5qbwcXqqC3IgupqvD6epq9g
 =
X-Gm-Gg: ASbGncuaSiyMdKfWw4xnAh3PYji7Tz+ETxAapnDTqq35GF7eIB2B4T0iXRbJ5Edpz//
 WEfLUZyoOmgiNL8Nn0UXTATGi7fL2C0VnSOkHeDnS1oiTwHbmy0xh6tFlZg1NhU/I7XpLgNeU7r
 ZyHI9wMGh+jIsO+avR/b1CJ0Y5Dnlvvkfcg6rhDLYPZx3SacqfoD8XYnUKnVCzLf6yxj7nCIkrT
 byyZfjIayHvR0nNzgXhuMY4ugGISctOXPmedSQPu2DOH5Nhng==
X-Google-Smtp-Source: AGHT+IHIOW+WuNdmRT3/f1Wo0GW93i5XlLWseXqRiTC8MTB9+3ugAIxg1xjpy0IqDSGSPukrHei5rQ==
X-Received: by 2002:a05:6402:2349:b0:5d0:f904:c23d with SMTP id
 4fb4d7f45d1cf-5d3be785c74mr14816862a12.28.1733724081685; 
 Sun, 08 Dec 2024 22:01:21 -0800 (PST)
Received: from localhost ([223.72.85.1]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3eb7722acsm2194903a12.3.2024.12.08.22.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 22:01:21 -0800 (PST)
To: ltp@lists.linux.it
Date: Mon,  9 Dec 2024 01:01:15 -0500
Message-Id: <20241209060117.16870-1-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240930135809.9300-1-wegao@suse.com>
References: <20240930135809.9300-1-wegao@suse.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v5 0/2] cpuset02: Convert the test6 from
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

Wei Gao (2):
  cpuset02: Convert the test6 from cpuset_memory_testset.sh to C code
  cpuset_memory_testset.sh: Remove test6

 lib/tst_cgroup.c                              |   1 +
 runtest/mm                                    |   1 +
 .../cpuset_memory_testset.sh                  |  37 +----
 testcases/kernel/mem/.gitignore               |   1 +
 testcases/kernel/mem/cpuset/Makefile          |   6 +
 testcases/kernel/mem/cpuset/cpuset02.c        | 142 ++++++++++++++++++
 .../mq_timedreceive/mq_timedreceive01.c       |  80 +++++++---
 7 files changed, 212 insertions(+), 56 deletions(-)
 create mode 100644 testcases/kernel/mem/cpuset/cpuset02.c

-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
