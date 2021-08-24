Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D52003F5ED0
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 15:17:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 868E73C8DD1
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 15:17:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2BA263C3189
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 14:56:07 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 53D5660007C
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 14:56:06 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5A28E220C6;
 Tue, 24 Aug 2021 12:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629809766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z2T4LzZzWhOX2u4iWQkW4B5J8yOMqZz6b8MvFVh0hEY=;
 b=O0gT+HSdholIJOHfzS5rnWnjAwTAksWbkk9kC5i6iHHm5nLZ0tWOv5zxlg9nJbOMbAsWST
 pejMhy04/feX4hcQ8qWRhKnrW4Fq8uum2R7uybSQXo+bPNI5nDRQeRaxYm0QbCPi/aL81h
 xVhm6KbwZ4dowGEMGHhlY53ZqWhHiOg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629809766;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z2T4LzZzWhOX2u4iWQkW4B5J8yOMqZz6b8MvFVh0hEY=;
 b=Fi0LV0Z9nGj+brPr6+d3ZUE/xdhbU97MDkYWsqU785JeHYsB2+4xrVDp/JZIstGdP2tVXF
 dWBjjd31UrhKNZCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 258D913ABB;
 Tue, 24 Aug 2021 12:56:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jyb7L2XsJGGLbwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 24 Aug 2021 12:56:05 +0000
Date: Tue, 24 Aug 2021 14:56:12 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Leo Liang <ycliang@andestech.com>
Message-ID: <YSTsbAIgIyih05tb@yuki>
References: <YSTjO2rjk9sWRSWD@ubuntu02>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YSTjO2rjk9sWRSWD@ubuntu02>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 24 Aug 2021 15:17:25 +0200
Subject: Re: [LTP] [PATCH v7,
 1/4] lib: tst_umount: umount a mount point instead of a device
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
Cc: richiejp@f-m.fm, ycliang@cs.nctu.edu.tw, alankao@andestech.com,
 metan@ucw.cz, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> +		tst_res TINFO "The '$mntpoint' is not mounted upon, skipping umount"
                                                                 ^
								I would
								remove
								this
								'upon'
								here


Otherwise:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
