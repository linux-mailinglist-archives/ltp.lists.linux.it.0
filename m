Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF313DE913
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 10:59:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5C0CA3C8131
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 10:59:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2F40D3C2DBE
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 10:59:55 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B67231A00CC9
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 10:59:54 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C29F9200A8;
 Tue,  3 Aug 2021 08:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627981193; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qlrj0IppM9WzOTY0xx0R8tf87dpI/Rcpy74DEx49viE=;
 b=r816IH/ZAXqBVcV0tAZ+GNVCbskl1h0eCnVa5AXqwCGIK3UTj6ajSHT6G8tHREdo27ttTf
 hJKPPTPrEB29F40EIg77XvevCvXpI0ZDLMVrUwn1mxeMCZ4+y4WO/OG0DOpgRGNDmHFs3x
 5+IGIW8wyk80LEv5bCVRT1IGucNKC/A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627981193;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qlrj0IppM9WzOTY0xx0R8tf87dpI/Rcpy74DEx49viE=;
 b=3MHKKEduA7nmD2edunvAd9wRsBJLv9rZuB9itittRsmfR54CKjV+Wz58gowOMl+nW0i0S4
 UInheG74z4mG7fDQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id A5D2B13709;
 Tue,  3 Aug 2021 08:59:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 5NBwJ4kFCWEiewAAGKfGzw
 (envelope-from <mdoucha@suse.cz>); Tue, 03 Aug 2021 08:59:53 +0000
To: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
References: <20210803070520.30885-1-rpalethorpe@suse.com>
 <20210803083836.8612-1-rpalethorpe@suse.com>
 <20210803083836.8612-2-rpalethorpe@suse.com>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <731330a9-f374-2908-538e-3bb115897ab0@suse.cz>
Date: Tue, 3 Aug 2021 10:59:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803083836.8612-2-rpalethorpe@suse.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] Add setsockopt08, CVE-2021-22555
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
Cc: Nicolai Stange <nstange@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,
since this vulnerability is in the compat syscall wrappers, you should
also copy the arch bits check from setsockopt03 setup().

On 03. 08. 21 10:38, Richard Palethorpe via ltp wrote:
> This is a copy and paste of Nicolai's reproducer. The main difference
> is that I moved some code around. Of course I also used LTP library
> features, but essentially it works the same.
> 
> There are some hard coded values which I do not like. I guess these
> could be calculated or varied somehow. However I struggle to understand
> what the kernel is doing. This perhaps needs more investigation. We
> could try generalising this test and setsockopt03

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
