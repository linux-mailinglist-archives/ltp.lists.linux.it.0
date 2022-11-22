Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F44E633FDA
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Nov 2022 16:07:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1FAA3CCAE1
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Nov 2022 16:07:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 162613CAD8C
 for <ltp@lists.linux.it>; Tue, 22 Nov 2022 16:07:30 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6E4CF2001CA
 for <ltp@lists.linux.it>; Tue, 22 Nov 2022 16:07:29 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C75EC21D3E;
 Tue, 22 Nov 2022 15:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1669129648;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p56F2nwME/RWURtSP2TSQAQXPWOVxd9VX0H+uS1eGS0=;
 b=vuXrQNe9cPzsddLz3LepnRY7WjGBC2hwqmeAZKHW2mROYJ+vEC/3MyEuYK6J+FbxDozZEm
 3segnSrLYCCTBO93SzOf8Ltn3wF/GcoR3rdoo9VdYNi5IePV3twf3X9QV69NrvRNMQYzbP
 n1lrJXRS3YN9Glh8ZQGjpKAm6Mi0c6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1669129648;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p56F2nwME/RWURtSP2TSQAQXPWOVxd9VX0H+uS1eGS0=;
 b=GdC4hcnByfHfq5j9HOMxZvYvdEKAheoNPOxrH4K22oVhTseS4ITfKbDFlWzzX1TK2Cjf+X
 LZVb/9aXKFcYVcAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EAD6613B01;
 Tue, 22 Nov 2022 15:07:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +6QnMq7lfGM6CwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 22 Nov 2022 15:07:26 +0000
Date: Tue, 22 Nov 2022 16:07:24 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <Y3zlrBQ8fgJyNm7G@pevik>
References: <20221107191136.18048-1-pvorel@suse.cz>
 <Y2l3vJb1y2Jynf50@google.com>
 <3ac740c0-954b-5e68-b413-0adc7bc5a2b5@suse.cz>
 <Y22b3wWs2QfMjJHi@google.com>
 <9489dd1c-012c-8b5d-b670-a27213da287a@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9489dd1c-012c-8b5d-b670-a27213da287a@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/1] Possible bug in zram on ppc64le on vfat
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
Cc: Jens Axboe <axboe@kernel.dk>, Minchan Kim <minchan@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Nitin Gupta <ngupta@vflare.org>, linux-kselftest@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On 11. 11. 22 1:48, Sergey Senozhatsky wrote:
> > On (22/11/10 15:29), Martin Doucha wrote:
> > > I've tried to debug the issue and collected some interesting data (all
> > > values come from zram device with 25M size limit and zstd compression
> > > algorithm):
> > > - mm_stat values are correct after mkfs.vfat:
> > > 65536      220    65536 26214400    65536        0        0        0

> > > - mm_stat values stay correct after mount:
> > > 65536      220    65536 26214400    65536        0        0        0

> > > - the bug is triggered by filling the filesystem to capacity (using dd):
> > > 4194304        0        0 26214400   327680       64        0        0

> > Can you try using /dev/urandom for dd, not /dev/zero?
> > Do you still see zeroes in sysfs output or some random values?

> After 50 test runs on a kernel where the issue is confirmed, I could not
> reproduce the failure while filling the device from /dev/urandom instead of
> /dev/zero. The test reported compression ratio around 1.8-2.5 which means
> the memory usage reported by mm_stat was 10-13MB.

Martin, thanks a lot for reruning tests. I wonder problems on /dev/zero is a
kernel bug or just problem which should be workarounded.

> Note that I had to disable the other filesystems in the test because some of
> them kept failing with compression ratio <1.

Yes, I noted that as well at least on exfat and btrfs (if I remember correctly).
It wouldn't be a problem to just use it for vfat if we agreed test should be
modified.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
