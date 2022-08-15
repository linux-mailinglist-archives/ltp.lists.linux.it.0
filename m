Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F37592DEA
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Aug 2022 13:10:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D5A63C9739
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Aug 2022 13:10:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 88D0B3C013B
 for <ltp@lists.linux.it>; Mon, 15 Aug 2022 13:10:12 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A194D200910
 for <ltp@lists.linux.it>; Mon, 15 Aug 2022 13:10:10 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3DE563512D;
 Mon, 15 Aug 2022 11:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1660561809;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type;
 bh=gcX0J11PtGaSQUmxYCxIQYDnVMTa0E4BN2F1aCntmgA=;
 b=JbWmfXxuMdWxnVP8wsF2zA0/VIuMWOZgdAVcPKurhMUH/NZTuHX92Osmv/I173tzyBFxj1
 oEJaI9Y5fXoO5piXmyAWOHObwXDmwG4bWr3EZ2ikMi+oFlvhdZFs+aLhBBtW/y5mmOWNBQ
 pvzVq3ZIq00YpWaWNMSNcDwUWZhxk80=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1660561809;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type;
 bh=gcX0J11PtGaSQUmxYCxIQYDnVMTa0E4BN2F1aCntmgA=;
 b=LBXZGjmjmsSrLYkzbNFvYUhGlv3xHYNoZxh2t63ryaqb6uspF2JH/rfaIMN+UismGdTRv+
 C+/DDhuIcfI8KrDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E21EB13A93;
 Mon, 15 Aug 2022 11:10:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jeiPNZAp+mKeCQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 15 Aug 2022 11:10:08 +0000
Date: Mon, 15 Aug 2022 13:10:07 +0200
From: Petr Vorel <pvorel@suse.cz>
To: stable@vger.kernel.org, linux-mm@kvack.org
Message-ID: <Yvopj0gK5Dg95u+b@pevik>
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] Backport d4ae9916ea29 ("mm: soft-offline: close the race
 against page allocation") to 4.14 and 4.9
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>,
 William Roche <william.roche@oracle.com>,
 Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>, Michal Hocko <mhocko@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

I wonder if there was an attempt to backport d4ae9916ea29 ("mm: soft-offline:
close the race against page allocation") from 4.19 to 4.14 and 4.9 (patch does
not apply, haven't found anything on stable ML, nor in stable tree git,
therefore I assume it was left as not easily fixable).

I'm asking because William is writing a LTP test madvise11 [1] which shows it's
failing on 4.14.290 (the latest 4.14). I know that 4.9 EOL in 4 months, but 4.14
in Jan 2024, it might be worth to fix it at least for 4.14.

Kind regards,
Petr

[1] https://lore.kernel.org/ltp/1659975072-29808-1-git-send-email-william.roche@oracle.com/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
