Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 121F0707B7F
	for <lists+linux-ltp@lfdr.de>; Thu, 18 May 2023 09:59:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C0BC3CD43B
	for <lists+linux-ltp@lfdr.de>; Thu, 18 May 2023 09:59:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 593F03CB2AA
 for <ltp@lists.linux.it>; Thu, 18 May 2023 09:59:33 +0200 (CEST)
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AA1F1100023A
 for <ltp@lists.linux.it>; Thu, 18 May 2023 09:59:32 +0200 (CEST)
Received: from [172.29.16.86] (helo=finist-vl9.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.96)
 (envelope-from <khorenko@virtuozzo.com>) id 1pzYWe-00BNpU-1M;
 Thu, 18 May 2023 09:59:31 +0200
To: ltp@lists.linux.it
Date: Thu, 18 May 2023 10:59:29 +0300
Message-Id: <20230518075931.1344979-1-khorenko@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/2] scsi_debug/tlibio: lio_[read,
 write]_buffer() is to return total amount of read/written bytes
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
From: Konstantin Khorenko via ltp <ltp@lists.linux.it>
Reply-To: Konstantin Khorenko <khorenko@virtuozzo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

v2 changes:
  - code comments were switched to multiline ones

Konstantin Khorenko (2):
  scsi_debug/tlibio/lio_write_buffer: Always return total amount of
    written bytes
  scsi_debug/tlibio/lio_read_buffer: Always return total amount of read
    bytes

 lib/tlibio.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
