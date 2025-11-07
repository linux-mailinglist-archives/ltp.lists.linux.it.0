Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1218CC3DFC6
	for <lists+linux-ltp@lfdr.de>; Fri, 07 Nov 2025 01:32:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1762475524; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=RGz+JyYeXNkigYm1Z+JV6HGT12VmMlB8dHgb9Tmh8Kw=;
 b=MFJNusTp41zE3ebrAnB3+lQCevvpgLm9tMTHRoU7/bpT4qAnrGsc21vEgFNZ7UphYV0Au
 vGrZ3C218pjpsHEcoPgIRNhyXi2BfiaXBgFfzohsR/q4dhmI/3hZEpEMvb2deGL+HdbCr1q
 Oy/sbHSuLciYbSLXBXOJ1BWIcjWs0V0=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CBEB73CED7B
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Nov 2025 01:32:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F091A3CED5B
 for <ltp@lists.linux.it>; Fri,  7 Nov 2025 01:30:54 +0100 (CET)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 981691A009BE
 for <ltp@lists.linux.it>; Fri,  7 Nov 2025 01:30:53 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-640aa1445c3so369020a12.1
 for <ltp@lists.linux.it>; Thu, 06 Nov 2025 16:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762475453; x=1763080253; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AolxxJSeuNvZvok2EeqYO+JzMnCR7UyHwb0LVijFBuU=;
 b=KjMLEESsu9SFPH7t/qgQ6AoNBTS/+gNh3Vn4vh2wszgsut0O13xKy2kZ2Diqu0eycq
 BMC7D0Dm90f9FLyzssPXDA23pY6WDiY3ZBZtefVkvH/m2RdpbcBi4Y8OJ12X3vV88jxG
 9kmfnGAexK9KG+mt+A3xoJgbWNCe1Oofem5Deew4yIY384S4EJa/kWbg4Y1gUeuPB0oc
 fHxfH8ZSMu9FYGjiqiPYOrlBGFpT9T8VjnisMbOtS+SuMahTg148R4TG/k1G036StDf4
 0fTQNwJ7lLGx/oAjRsf0vTgbf60V+w1wjGpzuuzLwqmJs9hFrzrGKMKb/xPW9n7zK89q
 orgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762475453; x=1763080253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AolxxJSeuNvZvok2EeqYO+JzMnCR7UyHwb0LVijFBuU=;
 b=tAD6Q6weNrsu9P3P3gaklu+EQFH66Y02Nuof/Q+he8jvmVmiARBZhYsoRZUUQ5Ja8x
 LHOzCyZ2MKDfAh+AKtrtl8kqZGVaAaq0xGGn4G6jlGNd+jOeXdUPpSV4LPldvpLCo5RU
 0k5pPMVpQB9HWURmANxigFRBCChhcNd/iL7Fph9TEHDpfUcQHxHsRkJwix74HrkjzTFl
 4e9Hre0oTOh/agLlK4RiS4mW3/eeOIeONkR1oV/p75Gbfe1xyRzXIR8CfqAR1e6QxODt
 KUEzdC3+MO0Nfb9kySUPMydGJWGulyXfLjWXsuqWRK4JQYHfGrDKLL7ZQzeBaDVZas7f
 EuRg==
X-Gm-Message-State: AOJu0Yweimu49+zCUbJw44+HO4JoeYsN+mazHRNNu7IynvqW6pmQ8aOL
 xqDv4/1N/TETwXusUnRCqChCC+cD6v7tGjAjTf8L+7T3Mpc13upS9XO5UYBlUIs8HCZ1Yjy2o4Q
 FQik=
X-Gm-Gg: ASbGncsvuGyjYr+DHNScGG0/3BNaB8J34LBzxWicinaCNTO+EBE8Vq7PAmCNasD5fqq
 tXFt4yMyLWlENdhxXzy+nwI++G5E0aXv7ES65gw5l2yjAqhniRl9y1vH9Y69r+x8v4DH4bqzlvI
 psgT3tmeyJjsZwGgUFcnNV6tNyMC7H87zGmxIJ4Ku7R9T9r9iBlxv2HNdyN2eMsd9uXdjA7xy0r
 nJwEiJGneWqAzCiWVfyxXQCwEPMjKTAnwgn2/rBQs6EMSaZCO1hghTHCnkdgTaBtvhiqOfeAZCo
 SIy/eG6H8LKRX9PCUrHS9j5elmo53vRxDldrOLZZk1d+Xjjh4jC4PBGhaCe6kxlPDOyiE6KUaS/
 +Y0INNae1mj0QYNn5BFniFAy2bhUZb2XPc8+UEtCEczlTSqlfBNgq7tUVZcKDHdqR3n41meYxqZ
 Y=
X-Google-Smtp-Source: AGHT+IFrYmleWsvubx988rhR1Dkb1Ks9NchYUQU6YWoutzOshc6H2iwdK6njp8qAa7s3ywmxARuw3w==
X-Received: by 2002:a17:907:d8c:b0:b72:5882:9c79 with SMTP id
 a640c23a62f3a-b72c0abc9bamr119584066b.38.1762475452871; 
 Thu, 06 Nov 2025 16:30:52 -0800 (PST)
Received: from localhost ([2a07:de40:b240:0:2ad6:ed42:2ad6:ed42])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-b72bdbcb043sm88389766b.6.2025.11.06.16.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 16:30:52 -0800 (PST)
To: ltp@lists.linux.it
Date: Fri,  7 Nov 2025 00:30:26 +0000
Message-ID: <20251107003041.28929-4-wegao@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107003041.28929-1-wegao@suse.com>
References: <20251010064745.31361-1-wegao@suse.com>
 <20251107003041.28929-1-wegao@suse.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v4 3/4] ioctl_loop01.c: Add new support .needs_cmds
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

Signed-off-by: Wei Gao <wegao@suse.com>
---
 .../kernel/syscalls/ioctl/ioctl_loop01.c      | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop01.c b/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
index 4ecc93b1e..dd5097f5f 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
@@ -78,21 +78,7 @@ static void check_loop_value(int set_flag, int get_flag, int autoclear_field)
 
 static void verify_ioctl_loop(void)
 {
-	int ret;
-	const char *const cmd_parted[] = {"parted", "-s", dev_path, "mklabel", "msdos", "mkpart",
-					"primary", "ext4", "1M", "10M", NULL};
-
-	tst_fill_file("test.img", 0, 1024 * 1024, 10);
 	tst_attach_device(dev_path, "test.img");
-
-	ret = tst_cmd(cmd_parted, NULL, NULL, TST_CMD_PASS_RETVAL);
-	if (!ret)
-		parted_sup = 1;
-	else if (ret == 255)
-		tst_res(TCONF, "parted binary not installed or failed");
-	else
-		tst_res(TCONF, "parted exited with %i", ret);
-
 	attach_flag = 1;
 
 	TST_ASSERT_INT(partscan_path, 0);
@@ -113,10 +99,20 @@ static void verify_ioctl_loop(void)
 
 static void setup(void)
 {
+	parted_sup = tst_cmd_present("parted");
+
+	const char *const cmd_parted[] = {"parted", "-s", "test.img", "mklabel", "msdos", "mkpart",
+	                                  "primary", "ext4", "1M", "10M", NULL};
+
 	dev_num = tst_find_free_loopdev(dev_path, sizeof(dev_path));
 	if (dev_num < 0)
 		tst_brk(TBROK, "Failed to find free loop device");
 
+	tst_fill_file("test.img", 0, 1024 * 1024, 10);
+
+	if (parted_sup)
+		SAFE_CMD(cmd_parted, NULL, NULL);
+
 	sprintf(partscan_path, "/sys/block/loop%d/loop/partscan", dev_num);
 	sprintf(autoclear_path, "/sys/block/loop%d/loop/autoclear", dev_num);
 	sprintf(backing_path, "/sys/block/loop%d/loop/backing_file", dev_num);
@@ -148,5 +144,9 @@ static struct tst_test test = {
 		{"linux-git", "6ac92fb5cdff"},
 		{}
 	},
+	.needs_cmds = (struct tst_cmd[]) {
+		{.cmd = "parted", .optional = 1},
+		{}
+	},
 	.needs_tmpdir = 1,
 };
-- 
2.51.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
