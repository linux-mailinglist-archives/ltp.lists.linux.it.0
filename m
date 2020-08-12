Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE68242629
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Aug 2020 09:37:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 240AB3C3115
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Aug 2020 09:37:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 8AA4E3C25CA
 for <ltp@lists.linux.it>; Wed, 12 Aug 2020 09:37:14 +0200 (CEST)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B1C531000C32
 for <ltp@lists.linux.it>; Wed, 12 Aug 2020 09:37:13 +0200 (CEST)
Received: by mail-pj1-f66.google.com with SMTP id d4so678547pjx.5
 for <ltp@lists.linux.it>; Wed, 12 Aug 2020 00:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=DcXvY4IQxm7NInfibGJJAAvekshGPxbussAgA7/WQ/0=;
 b=JO84XkBPvLsVheAaduop/5D9msdfT0Du0y+OYGpKYxVahiWcgJB8mxA7Y99RVYLsiB
 ASUaP5foFDwhw8Jae7bqibWgqDF68vqxmExKn8/3YsY9ulM96Cz+e4sS8U2DVzv4ELX2
 vLswqX63U6IvGzK1Y6CHinzO41s0aQnKGvx+wDsR60C73HhNq7RMP7Lr7rsy6GtPQnaZ
 au+7g/O7rACz9BOhR5rwMTMqN8it0K315BPyTRsPJjX7eFLIlURGVyRWMLncg2MQx+um
 +pcyuE9ZcasWtfPpJFbes9sYAxqXLmz3NFbSrMdJjZ5m6RbQ1Mx0i2Est9DsFM3mVCef
 zttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=DcXvY4IQxm7NInfibGJJAAvekshGPxbussAgA7/WQ/0=;
 b=ulhcEnYDvOfS4/joacuzRyJjRFI6xiVerGq5qg6Hp5uuQ2DHw71EIUfSW5qfpM2fum
 /cg0mFrOWME7IdvxyMFa9jC3gtCK8hczPiCZYD4Ai90ePqmBI4r+KipchpoSkaG8ynEQ
 iTm1R2/2l4DH68xERqmKQg+d0iYu6cSZ8gLWR8U0fwf3ICHZB9ZxklNwaBxzZX9mNvVg
 Mf3EgiOvnVQqn1HIhOI5ZxxRVFIPQgUQMj5dq/4VMEpkmhQyMEe4Hq1DZkDIuGNcfjOx
 XKfSHdOaCgoAwEEHkvwlskS36BGtkX1uGo/BgPE3yd3dEESnXzhiAH8zmtae/3+2i9qG
 EqVw==
X-Gm-Message-State: AOAM530XAwEtuMeCxBKfgGOrvyQet8IP7GrxvvETQvMGdbZa9nZdRHNV
 mtzVVo5YQIg75JNagYBtsuk=
X-Google-Smtp-Source: ABdhPJxeWnh0b9TgemwoaChevVkYw1uVWoOiSklIuK1BNqAwg+YSp3Qz7AZCFTzqaXRnMb76frWKaw==
X-Received: by 2002:a17:902:59dd:: with SMTP id
 d29mr4205422plj.170.1597217772099; 
 Wed, 12 Aug 2020 00:36:12 -0700 (PDT)
Received: from bj616583pcu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id g5sm1385069pfh.168.2020.08.12.00.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 00:36:11 -0700 (PDT)
From: gengcixi@gmail.com
To: chrubis@suse.cz,
	ceh@ti.com,
	ltp@lists.linux.it
Date: Wed, 12 Aug 2020 15:35:28 +0800
Message-Id: <20200812073529.25715-1-gengcixi@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] device-discovery: auto detect UART_DEV devices
 for uart case
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
Cc: orsonzhai@gmail.com, Cixi Geng <cixi.geng1@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Cixi Geng <cixi.geng1@unisoc.com>

update device-discovery scripts for uart device, it will auto detect
the test machine uart devices, and filtered out of the on using dev.
This is an updated version which comes from patch [1] written by Cyril

[1] https://patchwork.ozlabs.org/project/ltp/patch/20200623112827.10744-2-chrubis@suse.cz/

Signed-off-by: Cixi Geng <cixi.geng1@unisoc.com>
---
 device-discovery.sh | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/device-discovery.sh b/device-discovery.sh
index 08460c41f..09993be36 100755
--- a/device-discovery.sh
+++ b/device-discovery.sh
@@ -1,5 +1,20 @@
 #!/bin/sh
 
-if [ "$1" = "UART_RX-UART_TX" ]; then
-	echo "UART_RX=/dev/ttyUSB0 UART_TX=/dev/ttyUSB0"
+find_uart_devices()
+{
+	UART_DEVICE=""
+	for i in /dev/tty*; do
+		TTY_DEVICES=`echo $i |grep "tty[[:alpha:]]\{1,\}[0-9]\{1,\}"`
+		if [ -n "${TTY_DEVICES}" ];then
+			if ( stty -a -F ${TTY_DEVICES} > /dev/null 2>&1 ) ;then
+				lsof | grep "${TTY_DEVICES}" 1>/dev/null 2>&1 || \
+				UART_DEVICE="${TTY_DEVICES} ${UART_DEVICE}"
+			fi
+		fi
+	done
+	echo "UART_DEV=${UART_DEVICE}"
+}
+
+if [ "$1" = "UART_DEV" ]; then
+	find_uart_devices
 fi
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
