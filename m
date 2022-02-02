Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D87AC4A6FAD
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Feb 2022 12:13:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6DEC83C98B0
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Feb 2022 12:13:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CC8683C8F4A
 for <ltp@lists.linux.it>; Wed,  2 Feb 2022 12:13:33 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3EC0F600830
 for <ltp@lists.linux.it>; Wed,  2 Feb 2022 12:13:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 592DA2110B;
 Wed,  2 Feb 2022 11:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643800412;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type;
 bh=ihC2d5T5P1pfZF4Fc9yQj/OKoi26WfVx7ryaYf26EXk=;
 b=OS2qCRtKkAJztulBUQ2+QSYfxbeiBRtoJo3CoguqXBSgnWFh1TpocBAztZMw2+yHzg0SSx
 UzLOMKW+6K/Rxaw4/oN+FXaebaF7jtTq0dWjlTggmVI6j2qfJeEz6h8IBZi/kKa1jGivKY
 TGmYe6gfqiYEV0qU0BsWkAAR8PC5TgY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643800412;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type;
 bh=ihC2d5T5P1pfZF4Fc9yQj/OKoi26WfVx7ryaYf26EXk=;
 b=rBj71y76HdzdkNMM9chJHARyWcKgeZQPl+XOb/6EeaPv+W0phBDnt4l4q+cv8SuNaL0BcR
 +Cpp0ftvGCpzdmBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 16F2213E05;
 Wed,  2 Feb 2022 11:13:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id olvrA1xn+mGMfQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 02 Feb 2022 11:13:32 +0000
Date: Wed, 2 Feb 2022 12:13:25 +0100
From: Petr Vorel <pvorel@suse.cz>
To: linux-sctp@vger.kernel.org, ltp@lists.linux.it
Message-ID: <YfpnVfrto4Elshy5@pevik>
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [RFC] SCTP tests in LTP vs. on github.com/sctp
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Xin Long <lucien.xin@gmail.com>, Neil Horman <nhorman@tuxdriver.com>,
 Vlad Yasevich <vyasevich@gmail.com>, Martin Doucha <martin.doucha@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

SCTP tests lksctp-tools [1] are also in LTP [2].
IMHO it's not worth to have it on both places.

lksctp-tools looks like to be the official ones [3] so maybe drop it from LTP?

Version in LTP was updated to 1.0.15 some time ago (upstream has 1.0.19, containing various fixes [4],
maybe worth to be backported to lksctp-tools? Frankly speaking even being older
version the LTP code looks to me better. One test was even rewritten to LTP new
C API [5] in order to apply more improvements [6].

BTW I'd really recommend lksctp-tools project to take new LTP C API [7] and
rewrite tests into it. But are these tests still relevant? (is it worth of
work?)

Kind regards,
Petr

[1] https://github.com/sctp/lksctp-tools
[2] https://github.com/linux-test-project/ltp/tree/master/utils/sctp
[3] https://github.com/sctp
[4] https://github.com/linux-test-project/ltp/commits/master/utils/sctp
[5] https://github.com/linux-test-project/ltp/commit/fcd43b3dd7a8e8fab2b03ec9fa659f21ff5cecb2
[6] https://github.com/linux-test-project/ltp/commit/fcd43b3dd7a8e8fab2b03ec9fa659f21ff5cecb2
[7] https://github.com/linux-test-project/ltp/wiki/C-Test-API

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
