Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5C0513CCE
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Apr 2022 22:44:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B94E83CA7F4
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Apr 2022 22:44:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E413A3CA756
 for <ltp@lists.linux.it>; Thu, 28 Apr 2022 22:40:56 +0200 (CEST)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 503C52005D8
 for <ltp@lists.linux.it>; Thu, 28 Apr 2022 22:40:56 +0200 (CEST)
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1669C3F325
 for <ltp@lists.linux.it>; Thu, 28 Apr 2022 20:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1651178455;
 bh=YBJ4ZAJhZuO2BukVJmF+x5JzUXa9MlbB+Z7rHgYbQb8=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=nw2o8eUXu29LQWWh7T9v+3ILo3+2lL9q8mRTS9voYyAhmn3KAJijLHb8FEgJOBLzU
 QhERBFN53ciWCharSx/vwOD4+yUYomOUPJ6d26JAzS+1h/5oLqxHPI96+8zOOCu5Yk
 TfnXcID/GTStSlkTN43EzSlAhUWQep8HTk0ZfCRi4pBjP7RR6tkcRzmCd6wPfCZVJn
 6QCUvMhcJyrXPZfgtZHs1Hjd1NLuyBnYqZ6oyv2IS+S/tv2uPH51eUslcOG+qtzMKe
 JjjlAoaK/2ZMsbfKyKfuwrfkC7Sa0nehlsVUfF83Gmbysvo4XOGOK20M/FQ1o9Ufls
 gzF3B7Bi3AyLg==
Received: by mail-pf1-f199.google.com with SMTP id
 a16-20020a62d410000000b00505734b752aso3279865pfh.4
 for <ltp@lists.linux.it>; Thu, 28 Apr 2022 13:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YBJ4ZAJhZuO2BukVJmF+x5JzUXa9MlbB+Z7rHgYbQb8=;
 b=uNyX8S0NOiea/ktNYQ1yEkGQaeDZd0zVwn5W7gdv0aqiRoqyYUTrzcQd3hUI1B+Qbf
 Beaa2NblICFXIgjEZzWVLv03PqPf1trsEJJWzU8Lo7W8y0ZDoWH5HtvBy1Impi1LjEAV
 egzRz0UWWtEPgRzHfMeSKjFk4bMoLCV7Ty8XXxUt3LBIv3pMvvhJlGeYURUUVS6quaSW
 IO0FddxSVwt/dHcACQaMY8Qtook9k1T334zngiylFP8VGL7POlGeS+I/eQtH8Qt6a17p
 GItz1ws6P0d3ku8R246OEBTL6S9FD1Dpdqw253UroOhe8Sss643X0rf0TdEgEU4FuuOe
 w7wA==
X-Gm-Message-State: AOAM531yMOuKThvlqLpQqh9F3CWZrCxDbZPFumgUcvaxxTUiW2Wu9wSG
 +oIu/5jS0qDS381C96qj4FtpbIU50UsfdbRZiyH4FdNXafi75W8uLQptYm8VNUGnldHypjEQjAa
 OiGkS2Acy375IJG3cpb0VkjeFx8ga
X-Received: by 2002:a17:902:aa8e:b0:158:e948:27 with SMTP id
 d14-20020a170902aa8e00b00158e9480027mr35345337plr.69.1651178453391; 
 Thu, 28 Apr 2022 13:40:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKzl/SYc97WwpEx3QeesK0qgMn/15TOotIKT/+0BNYa2iBonwuxu73U4Lwi7dppvVBgdcWPw==
X-Received: by 2002:a17:902:aa8e:b0:158:e948:27 with SMTP id
 d14-20020a170902aa8e00b00158e9480027mr35345299plr.69.1651178452846; 
 Thu, 28 Apr 2022 13:40:52 -0700 (PDT)
Received: from luke-ubuntu.buildd (cpe-66-27-118-101.san.res.rr.com.
 [66.27.118.101]) by smtp.gmail.com with ESMTPSA id
 f63-20020a62db42000000b0050d35bcdbc0sm659027pfg.181.2022.04.28.13.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 13:40:52 -0700 (PDT)
From: Luke Nowakowski-Krijger <luke.nowakowskikrijger@canonical.com>
To: ltp@lists.linux.it,
	rpalethorpe@suse.de,
	liwang@redhat.com
Date: Thu, 28 Apr 2022 13:39:44 -0700
Message-Id: <08a9905f9100414731f8aa7b61aa1da03a5be614.1651176646.git.luke.nowakowskikrijger@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1651176645.git.luke.nowakowskikrijger@canonical.com>
References: <cover.1651176645.git.luke.nowakowskikrijger@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 19/19] controllers: update cgroup_regression_test
 to use newer cgroup lib
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

The older function in the cgroup lib 'get_cgroup_mountpoint' has been
removed, so instead replace it with its old functionaility to get
mountpoint.

Also use the newer cgroup lib require operation to mount and cleanup a
cpu controller.

Signed-off-by: Luke Nowakowski-Krijger <luke.nowakowskikrijger@canonical.com>
---
v2: Use cgroup_require "$subsys" instead of manual greping the path

 .../cgroup/cgroup_regression_test.sh          | 31 ++++++-------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh b/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
index 592a1d3b1..c118c10c8 100755
--- a/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
+++ b/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
@@ -170,17 +170,8 @@ test3()
 		return
 	fi
 
-	cpu_subsys_path=$(get_cgroup_mountpoint "cpu")
-
-	# Run the test for 30 secs
-	if [ -z "$cpu_subsys_path" ]; then
-		mount -t cgroup -o cpu xxx cgroup/
-		if [ $? -ne 0 ]; then
-			tst_res TFAIL "Failed to mount cpu subsys"
-			return
-		fi
-		cpu_subsys_path=cgroup
-	fi
+	cgroup_require "cpu"
+	cpu_subsys_path=$(cgroup_get_mountpoint "cpu")
 
 	cgroup_regression_3_1.sh $cpu_subsys_path &
 	pid1=$!
@@ -193,7 +184,7 @@ test3()
 	wait $pid2 2>/dev/null
 
 	rmdir $cpu_subsys_path/0 2> /dev/null
-	tst_umount $PWD/cgroup
+	cgroup_cleanup
 	check_kernel_bug
 }
 
@@ -305,21 +296,15 @@ test6()
 test_7_1()
 {
 	local subsys=$1
+	local subsys_path
 	# we should be careful to select a $subsys_path which is related to
 	# cgroup only: if cgroup debugging is enabled a 'debug' $subsys
 	# could be passed here as params and this will lead to ambiguity and
 	# errors when grepping simply for 'debug' in /proc/mounts since we'll
 	# find also /sys/kernel/debug. Helper takes care of this.
-	local subsys_path=$(get_cgroup_mountpoint $subsys)
-
-	if [ -z "$subsys_path" ]; then
-		mount -t cgroup -o $subsys xxx cgroup/
-		if [ $? -ne 0 ]; then
-			tst_res TFAIL "failed to mount $subsys"
-			return
-		fi
-		subsys_path=cgroup
-	fi
+
+	cgroup_require "$subsys"
+	subsys_path=cgroup_get_mountpoint "$subsys"
 
 	mkdir $subsys_path/0
 	sleep 100 < $subsys_path/0 &	# add refcnt to this dir
@@ -334,6 +319,8 @@ test_7_1()
 		wait $! 2>/dev/null
 		umount cgroup/
 	fi
+
+	cgroup_cleanup
 }
 
 test_7_2()
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
