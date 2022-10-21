Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEDA607681
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Oct 2022 13:53:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D29F23CB1D0
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Oct 2022 13:53:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 760273C6E8B
 for <ltp@lists.linux.it>; Fri, 21 Oct 2022 13:53:40 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1FF3110005B0
 for <ltp@lists.linux.it>; Fri, 21 Oct 2022 13:53:39 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C691221AC7;
 Fri, 21 Oct 2022 11:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1666353218; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UhOoqH+bqPeZfg3Duh0gn/2V3oq6a7bNB6ZsLSsXz/M=;
 b=jHNu1KfuC1bSktI2e2xfZ2oPXRd7b5xtQTyZ1+gQraQwWKQTcg+QAW9y2bBPe4d796TdlK
 Fyuujc6qUVlFCgCrwWniBvXNYxNuvgjTz9CbvkmxncEldsnPuQsyAQ4/Ttimjv2xOGbtyp
 5y5hsE9u/cXVG5TnqEpjNxnOb96u2go=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1666353218;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UhOoqH+bqPeZfg3Duh0gn/2V3oq6a7bNB6ZsLSsXz/M=;
 b=PdZQjon2vScK8lG67YdYrlYE8dKFmiiQnbusyoOwj9xILr+OzTtDCxUi95iE1cAL6OP3fr
 bddm2OZtygoPikAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 916AF13A0E;
 Fri, 21 Oct 2022 11:53:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hib8H0KIUmOdTAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 21 Oct 2022 11:53:38 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 21 Oct 2022 13:53:30 +0200
Message-Id: <20221021115333.13725-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] LC_ALL for build, remove outdated doc
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


Petr Vorel (3):
  Makefile: set LC_ALL and LANG to C
  Makefile: Update copyright, use SPDX
  doc: Remove mini-howto-building-ltp-from-git.txt

 Makefile                                 | 28 +++--------
 doc/mini-howto-building-ltp-from-git.txt | 62 ------------------------
 2 files changed, 7 insertions(+), 83 deletions(-)
 delete mode 100644 doc/mini-howto-building-ltp-from-git.txt

-- 
2.38.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
