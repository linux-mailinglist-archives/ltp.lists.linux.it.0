Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 498D2398E4D
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Jun 2021 17:19:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A71973C5541
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Jun 2021 17:19:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DB79B3C556F
 for <ltp@lists.linux.it>; Wed,  2 Jun 2021 17:18:31 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7549E1400445
 for <ltp@lists.linux.it>; Wed,  2 Jun 2021 17:18:31 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E2AFE1FD9E;
 Wed,  2 Jun 2021 15:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622647110;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CDy6IX3UIOocuC+e49z4h7GWObpU0IDq+HoU9XpxzMg=;
 b=G35qeNILTVOEGpS7tMLTGCmb8yXUsmkBzkRtXlO6KwLOJsrgazCSvM+7lSy+ndfb7EzLfB
 AANHAhZv+8TWhFfbCC+NSmnify73xXcGSthoX3dViZyTEYxmGJi1TUi/Nrr4eUp40ERsbQ
 o9J5yUNscnXID4Fe64OjxWEtrj0rphU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622647110;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CDy6IX3UIOocuC+e49z4h7GWObpU0IDq+HoU9XpxzMg=;
 b=Ui7rmhhPmJ2NZnmpIvdwZLkQyzUtzjtTz71QzIBmnZ+28YctxjXEAtna9pDVVnr4aCgQRy
 LNOye4dpDMDUiNDg==
Received: by imap.suse.de (Postfix, from userid 51)
 id DB52311A98; Wed,  2 Jun 2021 15:28:32 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C510011DC1;
 Wed,  2 Jun 2021 11:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622632094;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CDy6IX3UIOocuC+e49z4h7GWObpU0IDq+HoU9XpxzMg=;
 b=nwDRaeWZM97xux4C/TxkwjfYfXYj1Bfw4g4jjkktyeEusYom3aMkBIDbqrw3XURj2LlRtj
 ymgZuwvC8btQljmV4xjGXkqd6B9BTbvFyLbhEG/zK4nfGSMPFteCgyvB6g0zg01rlgmjqW
 VGyyFS+mdcgd5vaKq0BiT04NIc+PyyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622632094;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CDy6IX3UIOocuC+e49z4h7GWObpU0IDq+HoU9XpxzMg=;
 b=0FH2Ja176sGY5CNWJ/L+8TGmf6LSmwBR160OhgpPzF7hgCWYVFnv+iFj4ng4Gfu5/pCVyX
 e/+Oz3eeOdfwYzAw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id /DUqLp5mt2CaZgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 02 Jun 2021 11:08:14 +0000
Date: Wed, 2 Jun 2021 13:08:13 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YLdmnYAbxzADpqCU@pevik>
References: <20210526172503.18621-1-pvorel@suse.cz>
 <210e1e4f-23d8-6a8b-18cb-ea7a4e7f89c2@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <210e1e4f-23d8-6a8b-18cb-ea7a4e7f89c2@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [LTP PATCH v2 1/3] nfs_lib.sh: Detect unsupported protocol
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
Cc: linux-nfs@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On 26.05.2021 20:25, Petr Vorel wrote:
> > Caused by disabled CONFIG_NFSD_V[34] in kernel config.

> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > new in v2

> >  testcases/network/nfs/nfs_stress/nfs_lib.sh | 6 ++++++
> >  1 file changed, 6 insertions(+)

> > diff --git a/testcases/network/nfs/nfs_stress/nfs_lib.sh b/testcases/network/nfs/nfs_stress/nfs_lib.sh
> > index 3fad8778a..b80ee0e18 100644
> > --- a/testcases/network/nfs/nfs_stress/nfs_lib.sh
> > +++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
> > @@ -94,9 +94,15 @@ nfs_mount()

> >  	if [ $? -ne 0 ]; then
> >  		cat mount.log
> > +
> >  		if [ "$type" = "udp" -o "$type" = "udp6" ] && tst_kvcmp -ge 5.6; then
> >  			tst_brk TCONF "UDP support disabled with the kernel config NFS_DISABLE_UDP_SUPPORT?"
> >  		fi
> > +
> > +		if grep -i "Protocol not supported" mount.log; then

> Hi Petr,

> It's better to add '-q' flag to grep.
Good point, thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
