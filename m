Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA7ACDBE7
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Oct 2019 08:45:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3CD923C1D33
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Oct 2019 08:45:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 7B2E33C0B8F
 for <ltp@lists.linux.it>; Mon,  7 Oct 2019 08:45:43 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CF3DE200936
 for <ltp@lists.linux.it>; Mon,  7 Oct 2019 08:45:42 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 871309F7FC;
 Mon,  7 Oct 2019 06:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1570430741; bh=HU+xQUp7PoM65/Fu+HR136ozzA2XdL9xvDCSsezJ3+M=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=P//QmzcU2dHhXU3vXC54Lzw03ZpeIn073R9lc9hFfb2z+kxHQXKm2kSQJYdJ+pPdP
 rc7EemllchgWIJP+Q3UYl892tbfwobauJNx4KiNEdG1RtkJPmp+u6/OWBbj2zTLJ2v
 KiPUHH1hmd5MV7rwL+yi4v5tDWWdOwbaBt/jdfMo=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	chrubis@suse.cz
Date: Mon,  7 Oct 2019 08:45:33 +0200
Message-Id: <20191007064534.4364-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] (no subject)
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

Added changes suggested by Cyril.
BTW: The kernel is still tainted, even if the license is set, because
of out-of-tree module:
> ltp_lsmod01: loading out-of-tree module taints kernel.



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
