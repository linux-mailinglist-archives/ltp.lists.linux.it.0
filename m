Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F72D0713
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 08:16:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 02D923C2271
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 08:16:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 853083C134D
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 08:16:29 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9EC6C14016DA
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 08:16:28 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 6EBA09F7FB;
 Wed,  9 Oct 2019 06:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1570601787; bh=ghrCKew+cvdejQcmrZ9Ygdi/5J4D6V7V2GjDhq/W7F8=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=eUZNwYdnnEHbYq0ehG6WrI5jtpmYWmJQF8xQi2fYTkdWA5C2bI17IFvB9rpeIs0zI
 wG0FiiNR0q9/4PLTs7Lrg7WkMALy1o6V4yWBQQT5kmm3YsctrcHmAMosGd+/wlNNSK
 D8Vv0mN7czRPJ5A/bwTLG2lXeWbzeqT4HzSfYbCw=
From: Joerg Vehlow <lkml@jv-coder.de>
To: chrubis@suse.cz,
	ltp@lists.linux.it
Date: Wed,  9 Oct 2019 08:16:17 +0200
Message-Id: <20191009061619.48677-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] Add TST_USES_MODULE and tst_test_root
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

In preparation of lsmod01.sh patch v4.
The test requires a module only, if no modules are loaded and
in order to load the module, root is required.



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
