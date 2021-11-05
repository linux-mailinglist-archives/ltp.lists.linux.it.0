Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C2644621A
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Nov 2021 11:18:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5499F3C736A
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Nov 2021 11:18:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3C17E3C4F08
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 11:18:58 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 56595201019
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 11:18:56 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7F422212BB;
 Fri,  5 Nov 2021 10:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1636107536; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v0g1G75lzrdqUPOjSX8bMzl0JtOjyA7OMkoyZiojvFQ=;
 b=vvhCKQKgMa4bNQtYSjHISdZTTZm94tauuX6oNvfXtri/lhURAqUopTb1Oy8dlvInW8c57Z
 hj1ua1iPFcNO3jDOaEh9LK8r+ZGvi+XnaDpslwAcouFW/fAKwjEmsl12iu9W7Vv00Z2AJu
 +u2RLwEmHmZhrPd/8Aqony8A4xQuguc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1636107536;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v0g1G75lzrdqUPOjSX8bMzl0JtOjyA7OMkoyZiojvFQ=;
 b=JWvuSkIwcINpmN3eB4z8xFQ44aVYOlZmOr5wvKKSqqgjIAGKKr1YNI4vM2WcFliSAAUYlN
 1s1ScjiwFs1LzuAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 603AA13FE2;
 Fri,  5 Nov 2021 10:18:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ort8FxAFhWFeAQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 05 Nov 2021 10:18:56 +0000
Date: Fri, 5 Nov 2021 11:19:53 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YYUFSQ+7rLIqBrjA@yuki>
References: <20211103120233.20728-1-chrubis@suse.cz>
 <20211103120233.20728-8-chrubis@suse.cz> <YYKI9I05hEjiKNiE@pevik>
 <YYKLnxZL44ftguOx@yuki> <YYKMIuHDheI1PK8x@yuki>
 <YYKe0sdsN/qGRO8E@pevik> <YYKmqo3NCZi35DKB@pevik>
 <YYKsVYjYm0lk8cpD@yuki> <YYPb0HgsJ0YEZ9PB@yuki>
 <YYQ3O3XYoZ88GBBN@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YYQ3O3XYoZ88GBBN@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 7/7] docparse: Split into metadata and docparse
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I'd still appreciate make in docparse/ directory could somehow resolve missing
> dependency, but I can live without it as it's obviously meant to run make only
> in metadata/ directory.

The problem is that if we add any way how to trigger the ltp.json build
from the metadata directory it will crash and burn when parallel build
is invoked from the top level directory.

We would have to explain the dependency in the top level Makefile as
well as in the docparse/Makefile. Which would be complicated and error
prone.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
