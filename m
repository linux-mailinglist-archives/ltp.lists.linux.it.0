Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E794105F2
	for <lists+linux-ltp@lfdr.de>; Sat, 18 Sep 2021 12:39:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C1573C8805
	for <lists+linux-ltp@lfdr.de>; Sat, 18 Sep 2021 12:39:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E5B293C1CD1
 for <ltp@lists.linux.it>; Sat, 18 Sep 2021 12:39:22 +0200 (CEST)
Received: from mail-m975.mail.163.com (mail-m975.mail.163.com [123.126.97.5])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id C7D551000466
 for <ltp@lists.linux.it>; Sat, 18 Sep 2021 12:39:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=CRAM+
 5YpPlfeQgsQkNKHBVqjNpiujLp9G/CIagB9VIU=; b=YlMnGW1xCSYEYhHBARVn9
 icrrbCzcr0L4IlmIqA6Mc9WEvC9KPtuafx0gKWkVe4+Kd5n9Md0i1TJNRmHwoGBl
 aDRcbCwVJjnDwEV0GxiOBiIQ9cMgeaQz4QokJ1kEaknrYvJetxmlrqWMDj/S88OO
 brHIe1TKBW1xz7QAezw0Fc=
Received: from [172.20.10.4] (unknown [122.96.47.73])
 by smtp5 (Coremail) with SMTP id HdxpCgD3PerTwUVhZHm8BQ--.6467S2;
 Sat, 18 Sep 2021 18:39:17 +0800 (CST)
To: QI Fuli <fukuri.sai@gmail.com>, ltp@lists.linux.it
References: <20210918072609.8576-1-qi.fuli@fujitsu.com>
 <20210918072609.8576-6-qi.fuli@fujitsu.com>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <5038c65d-80ab-ee73-b3d7-a13cb5194851@163.com>
Date: Sat, 18 Sep 2021 18:39:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20210918072609.8576-6-qi.fuli@fujitsu.com>
Content-Language: en-US
X-CM-TRANSID: HdxpCgD3PerTwUVhZHm8BQ--.6467S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr18Zw18JF4ktFWkKF1rZwb_yoW8CrWxp3
 srAr4jvw4rJ3Wvkw17uF4vg3y8Xw15tr1fG3Wqvws8CrnayayUtrsFqa4UXF12grWfWFWa
 ka1vgrWFq34YvFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j-SdgUUUUU=
X-Originating-IP: [122.96.47.73]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiqAoSXlc7V+H4BAAAsI
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 5/5] syscalls/dup2: rename dup205 to dup204
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
Cc: QI Fuli <qi.fuli@fujitsu.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This patch looks good to me.

On 9/18/21 3:26 PM, QI Fuli wrote:
> Signed-off-by: QI Fuli <qi.fuli@fujitsu.com>
> ---
>   runtest/syscalls                                      | 1 -
>   testcases/kernel/syscalls/dup2/.gitignore             | 1 -
>   testcases/kernel/syscalls/dup2/Makefile               | 2 +-
>   testcases/kernel/syscalls/dup2/{dup205.c => dup204.c} | 0
>   4 files changed, 1 insertion(+), 3 deletions(-)
>   rename testcases/kernel/syscalls/dup2/{dup205.c => dup204.c} (100%)
>
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 29d7752c7..75304f2f1 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -152,7 +152,6 @@ dup201 dup201
>   dup202 dup202
>   dup203 dup203
>   dup204 dup204
> -dup205 dup205
>   
>   dup3_01 dup3_01
>   dup3_02 dup3_02
> diff --git a/testcases/kernel/syscalls/dup2/.gitignore b/testcases/kernel/syscalls/dup2/.gitignore
> index 6c4685b80..0c9a8cd75 100644
> --- a/testcases/kernel/syscalls/dup2/.gitignore
> +++ b/testcases/kernel/syscalls/dup2/.gitignore
> @@ -2,4 +2,3 @@
>   /dup202
>   /dup203
>   /dup204
> -/dup205
> diff --git a/testcases/kernel/syscalls/dup2/Makefile b/testcases/kernel/syscalls/dup2/Makefile
> index 28fc158e4..fcdd146b7 100644
> --- a/testcases/kernel/syscalls/dup2/Makefile
> +++ b/testcases/kernel/syscalls/dup2/Makefile
> @@ -6,7 +6,7 @@ top_srcdir		?= ../../../..
>   include $(top_srcdir)/include/mk/testcases.mk
>   
>   ifeq ($(ANDROID),1)
> -FILTER_OUT_MAKE_TARGETS	+= dup201 dup205
> +FILTER_OUT_MAKE_TARGETS	+= dup201 dup204
>   endif
>   
>   include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/syscalls/dup2/dup205.c b/testcases/kernel/syscalls/dup2/dup204.c
> similarity index 100%
> rename from testcases/kernel/syscalls/dup2/dup205.c
> rename to testcases/kernel/syscalls/dup2/dup204.c


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
