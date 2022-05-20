Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF7252E8DF
	for <lists+linux-ltp@lfdr.de>; Fri, 20 May 2022 11:33:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 613D53CAAF7
	for <lists+linux-ltp@lfdr.de>; Fri, 20 May 2022 11:33:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 649B63C4DB3
 for <ltp@lists.linux.it>; Fri, 20 May 2022 11:33:11 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id ADA1B600342
 for <ltp@lists.linux.it>; Fri, 20 May 2022 11:33:10 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E748521B4D;
 Fri, 20 May 2022 09:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1653039189; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xa/8jmrAqSx8K+zkksNYj44N3fkSUKyKcbiRrmzOavE=;
 b=GQUvYK3Qpg9WRzMQBjeuSD2BBZH/cmSpFAwPY1byTqwG90CAKxtRG/n57TZ8P97tSUIiKN
 KMg65GgwsfBGn384221n1xg1FAcn7DwHOWyBdW95HQ4w0zR7f5AAygcjcOK+H/JlTp8Qf3
 nooRkOqWZUn48ViLZybIEHFVGscZovg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1653039189;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xa/8jmrAqSx8K+zkksNYj44N3fkSUKyKcbiRrmzOavE=;
 b=9Pfc5N3OZLy0acf+ZRQY0rqYRKEzNx3qJqCAg3m9uDSs7QvH5UnkdJuRuNycRk00xx7Xe4
 yOLqm+piYvG+xyBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D1CE213AF4;
 Fri, 20 May 2022 09:33:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qegpMlVgh2KmcQAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Fri, 20 May 2022 09:33:09 +0000
Message-ID: <e5fd3db9-d113-c3b0-82a6-58d45bb4a246@suse.cz>
Date: Fri, 20 May 2022 11:33:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Cyril Hrubis <chrubis@suse.cz>
References: <20220519121056.1181-1-mdoucha@suse.cz> <Yodes44v5tnei8p9@yuki>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <Yodes44v5tnei8p9@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.6 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] pty07: Resize console to the same size as
 before
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

On 20. 05. 22 11:26, Cyril Hrubis wrote:
> I guess that the actual size we pass to VT_RESIZEX does not matter when
> we attempt to trigger the race.

I've tested this on SLE-15SP1 GM kernel which is older than the fix and
this version still triggers the crash. Technically we could even pass
all zeroes which would simply leave all console parameters unchanged and
it'd still work because the ioctl implementation sets a flag in the
freed memory anyway. But that behavior might change in the future so
I've decided to just set the rows and cols to the values queried from
kernel.

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
