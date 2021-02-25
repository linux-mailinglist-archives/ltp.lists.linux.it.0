Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 299C2325010
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Feb 2021 14:00:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E56063C5A5C
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Feb 2021 14:00:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id A72E53C0EA5
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 11:50:47 +0100 (CET)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5FB01600BEB
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 11:50:47 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id f8so2977931plg.5
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 02:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=70XV8CEHSkMa1rt+fMT8WvCaK1EwHSR64yoUJlYJTYw=;
 b=DhDSRGXWZcaim+CMRCLHQjxz0sk+W4amY4TBRlv19iDknaJE5ZLBnyuUzSTYoLfS6A
 myDf6qOFtQAZl17fgay+kHM4Iv/J7VdcGXlzJZf5tKKnOqU6jiBqbswRL6zRcjQuXUyS
 645qHl1h3PG+4cA2+5QSHJibsD6HvRunXMkxzALV2AEf1W8ziB3LG2y5ZexXKGakv+Fu
 vALFV9kKqQzKHqRf70FHidRxkKY0ZN2gYLtbcqAp7cuEZATZjllMv2LNolkHVIWP6BiK
 BjtHivUyc03Nbp6xVere1j3XBTGO9h3SMEgqqwb1+TY0JgN9+gJaYai4Ne5DR2LHJzaK
 hAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=70XV8CEHSkMa1rt+fMT8WvCaK1EwHSR64yoUJlYJTYw=;
 b=tzQlapGoNu7NI5+0hu94clhHTpVzL66jc6CvpFTSoF4SXG3R9jwj4L3+tOaukJ2J7z
 qnuyqPpecucPhDYFm1/ZpMFILOK8rMOq6XsWTxWqoz4u9pSVizOqaSEicJNxpFRwa5NB
 hTHJC3OVNS/MOOtbPOzb6MBS1z2CtnynGPwt47bcN8DW5VwETvH2MUCnKqMuLAWwDJwt
 f4k3UpiOIcISoIKcaxmitbeM5ducZbTG/1fgI33ONtj5/6lXa6S3MlE+5gep8/dXnF/N
 ErFOLTnQVDNETEJg8eA1ZhZdfIoeJp3Hd73rWHUbnMKp5gm3qYS0zzbnALgj554Weq5V
 mi+w==
X-Gm-Message-State: AOAM530jSEMDWI1oHCzvtpNiZnjXzTwqnjNq6y045DOGVJLv+GfzsUjW
 0GTFL6f+M1CcYMbjKZ8fKqq9Kkf5M0uVbA==
X-Google-Smtp-Source: ABdhPJyzt0wdfDxCk45BzHXW0dbnKAHeCaeM6YVCQxfWAUpsiVmQvf0lQAOdLV9pCkMVSng14DUWVA==
X-Received: by 2002:a17:90b:1194:: with SMTP id
 gk20mr2703963pjb.155.1614250245632; 
 Thu, 25 Feb 2021 02:50:45 -0800 (PST)
Received: from localhost.localdomain ([2409:4071:e0b:a4e5:c4eb:2ad5:463:383e])
 by smtp.gmail.com with ESMTPSA id
 o127sm5746649pfg.202.2021.02.25.02.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 02:50:45 -0800 (PST)
From: Pankaj-Joshi <pankaj.joshi347@gmail.com>
To: ltp@lists.linux.it
Date: Thu, 25 Feb 2021 16:20:24 +0530
Message-Id: <20210225105024.25561-1-pankaj.joshi347@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 25 Feb 2021 14:00:09 +0100
Subject: [LTP] [PATCH] Updated README.kernel_config
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: pankajjoshi347 <pankaj.joshi347@gmail.com>

---
 README.kernel_config | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/README.kernel_config b/README.kernel_config
index 547dd4f33..eed19e557 100644
--- a/README.kernel_config
+++ b/README.kernel_config
@@ -18,8 +18,11 @@ CONFIG_IPC_NS=y
 CONFIG_USER_NS=y
 CONFIG_PID_NS=y
 CONFIG_NET_NS=y
+CONFIG_TIME_NS=y
 CONFIG_VETH=y
 CONFIG_MACVLAN=y
+CONFIG_TUN=y
+CONFIG_TAP=y
 
 The IPC namespaces do not automatically enable IPC, so you may
 also want to have:
@@ -128,6 +131,8 @@ CONFIG_CRASH_DUMP=y
 CONFIG_PM=y
 CONFIG_HIBERNATION=y
 CONFIG_KEXEC_JUMP=y
+CONFIG_SECCOMP=y
+CONFIG_NUMA=y
 ---------------------------------
 Enabling HOTPLUG for your Kernels
 ---------------------------------
@@ -281,10 +286,32 @@ end
 1) Add or modify testcases when relevant kernel functionality changes.
 ---------------------------------
 
+---------------------------------
+Enabling Kernel Configuration to test Memory management features
+---------------------------------
+CONFIG_KSM=y
+CONFIG_THP_SWAP=y
+CONFIG_MEMORY_FAILURE=y
+---------------------------------
+Enabling Kernel Configuration to test other filesystems
+---------------------------------
+CONFIG_PROC_FS=y
+CONFIG_PROC_KCORE=y
+CONFIG_SWAP=y
+CONFIG_FANOTIFY=y
+CONFIG_QFMT_V2=y
+CONFIG_XFS_QUOTA=y
+CONFIG_HUGETLBFS=y
+CONFIG_HUGETLB_PAGE=y
+---------------------------------
+Enabling Kernel Configuration to test CPU/Task time and stats accounting
+---------------------------------
+CONFIG_BSD_PROCESS_ACCT=y
 ---------------------------------
 Enabling Kernel Configuration to test ext4 new features
 ---------------------------------
 CONFIG_EXT4_FS=y
+CONFIG_EXT4_ENCRYPTION=y
 CONFIG_EXT4DEV_COMPAT=y
 CONFIG_EXT4_FS_XATTR=y
 CONFIG_EXT4_FS_POSIX_ACL=y
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
