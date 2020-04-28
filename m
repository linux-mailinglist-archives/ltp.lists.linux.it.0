Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5F51BB5E0
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 07:25:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A13B43C5F41
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 07:25:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 8E21C3C2832
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 07:25:36 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9562C1A00CBF
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 07:25:35 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id d17so9783411pgo.0
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 22:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hP2STtD3rssbe+U7+wJM7LvpWaxYYuy6rQGUccH2PNY=;
 b=ONPOo7UNw6YvQP2Sng52TaRDHu3NbKZ8f2YjAZRcF37xz68xM5kZ2UUa2cHZPcnaih
 FcmcA1rk+89jhcOF+PjYy6pB9Mo9bAyVUn6uWtZZMJNepebWBuFQxoqbhwWW5+mYIUtv
 y5vFl8tvGIY6sH5CVIZR8DqL+l++xXtPMcJC07+m9OiSopwNb8ZvX7uEZzZh7/uLvBT3
 SMCXBDcAKk1ROEqPK0+wQNSwG1sZKMaeIAszFA+m3G1c5cDI7TjR7V0ZbvmPwja4uowk
 FxMe4prOdgSnFC06/vKP04DBkj1BVGHRNdTipoqGG3jkUre8YW9Qy2s1XwAySyCPrOmd
 UtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hP2STtD3rssbe+U7+wJM7LvpWaxYYuy6rQGUccH2PNY=;
 b=dKdKERAkXuXqwndK5TAt2xsT2JvoMq4k3IGG4q2DYHwXqMrIR6QwZPY3Nn8wwzxxAo
 ZIgIzBoZXjkziUoDyJ4IXynvWME4PLw0lHeN0R9+hPNQpcjmpY/K8pUwoiNFBh8Hl917
 /McJFHvRjqKkBg/KsRhn1V9vfGIInWgTXSBoXqghzJtW4Jz9bDsHWFNfLnNuOP5scylF
 A1eKO6H9DoeoeImm+6uGr/HcnvJh86xJstNuZzu/O2yvlYmiohOMnAP3+fYkyFOL25qi
 sykrQe0Zr/iQSYSA4Vg0K6Oz+VdgdsX+hHnOZ6ITrVEHUTV7R+NAl1VyEQpgmqMRtit1
 Y29Q==
X-Gm-Message-State: AGi0PuZw1XFsTA1NqpMBDqNdLMYdaMRX5lK3r53Kwy18PHYZIne7Flbv
 6s5KHdc9NC7BgMDO1clHwr9/dMAiy5w=
X-Google-Smtp-Source: APiQypLypAZ3wlWLXIzjXtIsdRXfT0ObN0RlvGVxS19IQl+ZALZ4ek79l914+hsR24q4yNt1VRbVLw==
X-Received: by 2002:a62:1801:: with SMTP id 1mr28437960pfy.230.1588051533704; 
 Mon, 27 Apr 2020 22:25:33 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id gn20sm940669pjb.24.2020.04.27.22.25.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Apr 2020 22:25:33 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 28 Apr 2020 10:55:30 +0530
Message-Id: <c3cbc45d1758c6eaf1957c7e75d920b7990e24eb.1588051498.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V2] syscalls/pipe2: Add pipe2_02_child in .gitignore
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V2: Move it a line up to keep ordering intact.

 testcases/kernel/syscalls/pipe2/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/syscalls/pipe2/.gitignore b/testcases/kernel/syscalls/pipe2/.gitignore
index 773450a484af..50f7023b8dd4 100644
--- a/testcases/kernel/syscalls/pipe2/.gitignore
+++ b/testcases/kernel/syscalls/pipe2/.gitignore
@@ -1,3 +1,4 @@
 /pipe2_01
 /pipe2_02
+/pipe2_02_child
 /pipe2_04
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
