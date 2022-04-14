Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A4D501B81
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Apr 2022 21:03:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 17ED13CA5F7
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Apr 2022 21:03:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 99B233CA3B8
 for <ltp@lists.linux.it>; Thu, 14 Apr 2022 21:03:13 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1CC8F2005D0
 for <ltp@lists.linux.it>; Thu, 14 Apr 2022 21:03:11 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1429D21613;
 Thu, 14 Apr 2022 19:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1649962991;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lN99G0X9TfTnpJWGd508oHSDaMuGo+G9XBfOFf3SBRI=;
 b=1iITSigjjZvqkqWKhHvMtL/cdeZyAmdu85sdDmk4kbzeBe4Gpy9bmJVNEvVjiDWDUhQykn
 p+tYyJpHHJGAKDWeS2yOFOoE/Rt5S1EkUQRdU/bMhVxYHnMsfHY/ziBk5bkVISWgYFlozI
 aN/7SFzfdCDTNXTm9YdHauHVvfR8Ogo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1649962991;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lN99G0X9TfTnpJWGd508oHSDaMuGo+G9XBfOFf3SBRI=;
 b=WYmyu5sakVSaDrCvLJUOIw4cVHTI0xI1u8Jqoub7ZhEsTB+WsGjEjHdCj3kxnEvd8ydydW
 L5VlCJDOFA9CHBAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BBCED13A86;
 Thu, 14 Apr 2022 19:03:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IWWQK+5vWGIIOQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 14 Apr 2022 19:03:10 +0000
Date: Thu, 14 Apr 2022 21:03:05 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <Ylhv6eH5aGHppbBJ@pevik>
References: <20220414145357.3184012-1-amir73il@gmail.com>
 <20220414145357.3184012-2-amir73il@gmail.com>
 <Ylg51UMuHsxbHRSA@pevik>
 <CAOQ4uxgd4dGjr8HmUc4uO_jp6JoHHNjzCTddt8_BJ6OWGUEeRg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxgd4dGjr8HmUc4uO_jp6JoHHNjzCTddt8_BJ6OWGUEeRg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/6] syscalls/fcntl: New test for DN_RENAME
 (dnotify)
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
Cc: Matthew Bobrowski <repnop@google.com>, Jan Kara <jack@suse.cz>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

> Sorry forgot to run it with -i

> Here is the fix if you want to apply it yourself:

> --- a/testcases/kernel/syscalls/fcntl/fcntl39.c
> +++ b/testcases/kernel/syscalls/fcntl/fcntl39.c
> @@ -89,6 +89,12 @@ static void verify_dnotify(void)

>         SAFE_CLOSE(parent_fd);
>         SAFE_CLOSE(subdir_fd);
> +
> +       /* Cleanup before rerun */
> +       SAFE_RENAME(TEST_DIR2 "/" TEST_FILE, TEST_FILE);
> +       SAFE_RENAME(TEST_DIR2, TEST_DIR);
> +       got_parent_event = 0;
> +       got_subdir_event = 0;
>  }

Thanks for a quick fix, patch merged (with minor changes to keep checkpatch happy).

Kind regards,
Petr

> Thanks,
> Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
