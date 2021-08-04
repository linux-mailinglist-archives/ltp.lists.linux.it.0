Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 929EE3E00D1
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 14:05:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F0CC03C7FEA
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 14:05:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AC9A23C65B1
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 14:05:13 +0200 (CEST)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4B83610005CC
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 14:05:13 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id y34so3971815lfa.8
 for <ltp@lists.linux.it>; Wed, 04 Aug 2021 05:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lQ6kK2qhKlXYJ3CHafuHzB41soE4amaNIlHVspG3E1Y=;
 b=dUy+nDE2cVE+bV+nfgAGHlLuYgYyya5ijKIT3K7QfOxzKD/3Y/d4F5kD84mTu/xQRW
 r55/5PoJvw0lG5ceVRdAgLsdDKHWgqR4NIsAog+ncmMCTQGhenGsElAV3CkX5gsa1r67
 jLzK11S9FBN/69/YOuANePbtipa19dAqtC1/l7IU8TW0WEn+WVUx20LxqP0LWEcSf2BD
 xLZI6n+FcHUGh8rMBay0muAhx+E09d8n7JaKMExFozfb/p1wkMHt2ml6zvbhf6CJKy/d
 krbR/VVSUQZsHmy/qnKm9kv4WaLsGs3wyvGuHG86BwmZY6lMWs9u+Fo7K9GcU727vmsM
 7eqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lQ6kK2qhKlXYJ3CHafuHzB41soE4amaNIlHVspG3E1Y=;
 b=omkK8ANMLH17WJxVH6xhZksTmDAE/wQYS5V9vUNiWYIDbQDXeSaVR2mF523ijLiSm8
 3/6gYkYgzpu44A+Kv5qNPr7DH16oR6QPDe0vKGNYcE4F8mAMVAc89mX7ItMfHGyQSLba
 emnsu3pyxMXTmUm+StkavbhHWvMZUl+7HVWAL0x1Q+9qWN7UQosmodJo6o6mnXUvb4AO
 fDHRgoBwpa6ED2oou+F4H6dSoyq3NZN1fUQz6ESW40i3bsiqJV5Up013owVpFYk7UNd5
 Olh2YkDKwhPWPDZ3yv/G+cJ+OVxA1aZ5BJakAN4yE8dZVODaxfj5KLr7/0OieMKqCqbB
 fjxQ==
X-Gm-Message-State: AOAM532hIy37eohiAhapAaNtARF/+kPhimOxda0D3vsdRX93/IPMiVSf
 VKHga0aSRyXICE/2AC7Tu1tW6NAjbIqf
X-Google-Smtp-Source: ABdhPJxEWPfhOGU3i/lUTJSBuAWTyuV7HPln2RtQJMP/Td2Rgm3ZKOztaLhjKEwbW01WC2H8T3QMXg==
X-Received: by 2002:a05:6512:e86:: with SMTP id
 bi6mr5990246lfb.592.1628078712623; 
 Wed, 04 Aug 2021 05:05:12 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.2])
 by smtp.gmail.com with ESMTPSA id w16sm179768lfp.1.2021.08.04.05.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 05:05:12 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Wed,  4 Aug 2021 15:04:46 +0300
Message-Id: <20210804120446.32835-3-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804120446.32835-1-aleksei.kodanev@bell-sw.com>
References: <20210804120446.32835-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] network/tst_net.sh: extend the pattern in
 tst_ping_opt_unsupported()
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

Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
---
 testcases/lib/tst_net.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index bb30c13ec..c15413a6d 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -811,7 +811,7 @@ tst_netload_compare()
 
 tst_ping_opt_unsupported()
 {
-	ping $@ 2>&1 | grep -q "invalid option"
+	ping $@ 2>&1 | grep -qE "(invalid|unrecognized) option"
 }
 
 # tst_ping -c COUNT -s MESSAGE_SIZES -p PATTERN -I IFACE -H HOST
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
