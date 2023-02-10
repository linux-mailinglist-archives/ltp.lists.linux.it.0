Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D403691636
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Feb 2023 02:28:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D259F3CC0BC
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Feb 2023 02:28:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CC7393C2730
 for <ltp@lists.linux.it>; Fri, 10 Feb 2023 02:28:35 +0100 (CET)
Received: from v03.bc.feishu.cn (v03.bc.feishu.cn [101.36.218.35])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D7A4260048B
 for <ltp@lists.linux.it>; Fri, 10 Feb 2023 02:28:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=ruijie-com-cn.20200927.dkim.feishu.cn; t=1675992499;
 h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=6Eu6rzMFV0j5Sh7t3Q2jomUBDeuLwbc+YKR0dE13f2M=;
 b=1zpnKpq/6R7F80hh4C3VPQyvzdPQZ/pbq3YmUwXebtIEbL5nZOfishrvbG5zpdMY+tDa4N
 oUuuA5sW6HFzDOws7TWRU0xEE5Rvr6Fllh6o0swVWl6TIfMa6YVrUOWsW8t+jvhCpRkA9x
 eTUaVzVVFNZ5wuE6+9XmsDl0BGLJwiRHXsMzPT0owrhTNgcK0dekS4m9QZ916O1RLJN15d
 5oau+shjkn3sAJvet+yXsSUMrJvsgvZZHyTk+2dWqJ99flCigYgZ39hJmlL+NUTWly1aEQ
 W8q07Zq4Jud3WA4wXHWnBbx6FIzXndHHAiRn3BIxyzpPbA7L8aDWXFnIv6W26Q==
Message-Id: <0328e9f247cfb76b27b68e9592bfb1954ddfe2b2.a192d563.9c88.4b19.a161.eca7160d4e8b@feishu.cn>
To: "ltp" <ltp@lists.linux.it>
From: "xiaoshoukui" <xiaoshoukui@ruijie.com.cn>
In-Reply-To: <0328e9f247cfb76b27b68e9592bfb1954ddfe2b2.80b5c6e1.08b5.4363.8caf.668693c771f5@feishu.cn>
Date: Fri, 10 Feb 2023 09:28:07 +0800
Mime-Version: 1.0
X-Lms-Return-Path: <lba+163e59da7+b116a3+lists.linux.it+xiaoshoukui@ruijie.com.cn>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEXHASH_WORD,HTML_MESSAGE,MIME_HTML_MOSTLY,MPART_ALT_DIFF,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH 1/1] Add ioctl_loop08 test for LOOP_GET_STATUS
 lock imbalance
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

Format to plain-text Signed-off-by: xiaoshoukui <xiaoshoukui@ruijie.com.cn> --- testcases/kernel/syscalls/ioctl/Makefile | 1 + .../kernel/syscalls/ioctl/ioctl_loop08.c | 132 ++++++++++++++++++ 2 files

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
