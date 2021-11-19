Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B97394571E1
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 16:42:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B8603C8AA2
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 16:42:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4A94E3C89AB
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 16:42:45 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9E271600704
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 16:42:44 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D1A5D1FD39;
 Fri, 19 Nov 2021 15:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1637336563; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mucNzesnt/VHKFIVjJWs3CfdgzCRiwEstVn3A8Nta2Y=;
 b=lKAW8YjNW1lsf0mQlhfOsBT6OqjCQ4EcuFR4gSeQzbBneL8nnc22zBWv5vnkNuyd+8eG+w
 oDlp5QFlBgA2dDAqlCpj9JxffQPEbTGDoHlPm88+hvJarHcTnmqPq3rX3piDM2EBQyqKe9
 IMNtCn22keC/8YSujsLzsjncyX2PVGY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1637336563;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mucNzesnt/VHKFIVjJWs3CfdgzCRiwEstVn3A8Nta2Y=;
 b=jZsLhO5yvPn62NEpp23ci4oX96qH+yWV0giXtK0vJf7pC0D7bQKllRwnLf3nnUaHDD5UaQ
 XSP8sT69soUi5JCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ABA5B13B35;
 Fri, 19 Nov 2021 15:42:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nerdKfPFl2F1JQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 19 Nov 2021 15:42:43 +0000
Date: Fri, 19 Nov 2021 16:43:49 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YZfGNUGxPx3MOST4@yuki>
References: <20211119074602.857595-13-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211119074602.857595-13-lkml@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 12/12] posix/interface/conformance: Fix/supress
 all unused-result warnings
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> --- a/testcases/open_posix_testsuite/conformance/interfaces/mmap/11-2.c
> +++ b/testcases/open_posix_testsuite/conformance/interfaces/mmap/11-2.c
> @@ -33,6 +33,9 @@
>  #include "posixtest.h"
>  #include "tempfile.h"
>  
> +#pragma GCC diagnostic push
> +#pragma GCC diagnostic ignored "-Wunused-result"
>
>  #define WRITE(str) write(STDOUT_FILENO, str, sizeof(str) - 1)

There is actually better trick than disabling the warning with pragmas,
we use it in lib/tst_test.c as well:

#define WRITE_MSG(msg) do { \
        if (write(STDOUT_FILENO, msg, sizeof(msg) - 1)) { \
                /* https://gcc.gnu.org/bugzilla/show_bug.cgi?id=66425 */ \
        } \
} while (0)

I guess that we should add PTS_WRITE_MSG() to the posixtest.h and make
use of it in all open posix tests.

The rest of the patch looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
