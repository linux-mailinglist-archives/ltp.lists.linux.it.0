Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7524481D6
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Nov 2021 15:34:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DB8223C773C
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Nov 2021 15:34:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 073E83C702E
 for <ltp@lists.linux.it>; Mon,  8 Nov 2021 15:33:58 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0BCDC600B15
 for <ltp@lists.linux.it>; Mon,  8 Nov 2021 15:33:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 430F71FD52;
 Mon,  8 Nov 2021 14:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1636382037; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7CHe6bJSG0IuWCiQjL8r4+CpXwFMHwaZ06TDo4HpBkk=;
 b=Erap0bVgAaGt8KaCij8zILo2rjhCaYB9H0Dle1v9pYuPdHtNW1rOSxDh0cKW58S7Jg6tuu
 X+NnD40vNAkplcXpckHdFVW+ydvOB+XCR2VKGq0hDwS0ngPmiuoXachzGhs9FoE4uX0ZYE
 wLWPXcveyqM0MwHE2p6OuZ07bdHvHuM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1636382037;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7CHe6bJSG0IuWCiQjL8r4+CpXwFMHwaZ06TDo4HpBkk=;
 b=Lk4XymYu8KkiLLGHAClmAWy59fMd3Eb+ctOJVzYxHJvsYCEgIN0axeCHiJNrPkuFIMKPT+
 /du6KVsx9qjg4VBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E92613BA0;
 Mon,  8 Nov 2021 14:33:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NnJTC1U1iWHOKQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 08 Nov 2021 14:33:57 +0000
Date: Mon, 8 Nov 2021 15:34:57 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YYk1kWh/yKY31YZB@yuki>
References: <20211104164528.29936-1-pvorel@suse.cz>
 <CAEemH2c4rfko1a=V-W04N0QXs9GKhJkc60_WjWFBe+BqbLQ3tA@mail.gmail.com>
 <YYj5QSB2pCzgxZtJ@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YYj5QSB2pCzgxZtJ@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] test_zero_hugepage.sh: Detect errors write to
 /proc/sys/vm/nr_hugepages
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Agreed, If the system memory is too fragmental to keep
> > enough hpages, there won't be an error returned.
> OK, wait little longer and then merge with keeping
> echo "128" > /proc/sys/vm/nr_hugepages

Also I wonder why do we request 128? I guess that 4 would be more than
enough.

Other than that:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
