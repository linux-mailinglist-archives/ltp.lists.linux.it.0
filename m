Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B300613849
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Oct 2022 14:44:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F0DBB3CAAEF
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Oct 2022 14:44:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8C6083C04BF
 for <ltp@lists.linux.it>; Mon, 31 Oct 2022 14:44:38 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C259F6000F7
 for <ltp@lists.linux.it>; Mon, 31 Oct 2022 14:44:37 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BFA873372C;
 Mon, 31 Oct 2022 13:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1667223876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4vQfayXbpac1p3SIQ1r/PIDxfrdPjz+rAkJTLhDruk0=;
 b=G4ggx8WeQOxKzc/0pms2vl4mdfYe5UctURSs8Lo4OmYNIXS2XU23syUxhHYm8U+pCokJry
 k8n4Fg04GvGW2rmIClqe10KzhvXQh/LxxiR6LjSWrFButxSWCyLqUqHReadWn+yX1crJIe
 72CCfq9X7pCO+peRBawZHJWZRRj5ErI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1667223876;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4vQfayXbpac1p3SIQ1r/PIDxfrdPjz+rAkJTLhDruk0=;
 b=UF5hBgQjBkJ+SLqciwmOfq05xO9EizW30gLpyk6eoUlx/TwQ7irHeU+mecakPrnGq1MlHK
 jJJOX0Y8k4bNe+Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A4BC113AAD;
 Mon, 31 Oct 2022 13:44:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qH+0JkTRX2MnZQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 31 Oct 2022 13:44:36 +0000
Date: Mon, 31 Oct 2022 14:46:12 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: zhaogongyi <zhaogongyi@huawei.com>
Message-ID: <Y1/RpJWqpuv7hKlU@yuki>
References: <03c247795faf46bc83f4f59af886d53b@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <03c247795faf46bc83f4f59af886d53b@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/fork02: new test for fork()
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
> > > Verify that current workdir correctly inherited by child.
> > 
> > Why test this?  Does fork() man-pages menthion this?
> > 
> 
> Man-pages does not menthion this, and the other field inherited does not mentioned too.

I guess that this is described in POSIX in:

"The new process (child process) shall be an exact copy of the calling
 process (parent process) except as detailed below:"

at https://pubs.opengroup.org/onlinepubs/9699919799/

And there is nothing about working dir in the list of special cases
hence working dir is exactly the same as for parent since it has to be
exact copy of parent.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
