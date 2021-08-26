Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 035A53F89C8
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 16:08:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 95FB93C2F5C
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 16:08:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4D1D33C2F17
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 16:08:01 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 533E560057E
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 16:07:59 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6EDFE1FE8D;
 Thu, 26 Aug 2021 14:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629986879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qcpzdX43Mgin2j8946dHNO6ZWvf01mDdQxAeJe++mng=;
 b=ycBohHugiTrggFcHyF7BiQ1cWczC+BO9xWW4a8MdbepD7vDqTfnuil90qERbC45l1YBpgv
 5gYQFDImSnyrQoyhbQd7WYkjbdcguR/ny/jmx29/ADjyyUPNVttTDtK8Tn79jliBC/SnYT
 jo7/JkiMBLi/JUyt8vlZxn7FmPSAUQY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629986879;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qcpzdX43Mgin2j8946dHNO6ZWvf01mDdQxAeJe++mng=;
 b=kfkE7BL1V+KrjJhf1+ulAB/RXsOnfBL9pWwXH71rGsoAdfwOZqGapF/g9NwC/3xS5y6UB1
 g46Rbz0a40wokGAQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 5C03F13659;
 Thu, 26 Aug 2021 14:07:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id xBxTFT+gJ2HLWwAAGKfGzw
 (envelope-from <mdoucha@suse.cz>); Thu, 26 Aug 2021 14:07:59 +0000
To: Petr Vorel <pvorel@suse.cz>
References: <20210826112212.26394-1-mdoucha@suse.cz>
 <20210826112212.26394-4-mdoucha@suse.cz> <YSeWymK0elcbiqzt@pevik>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <89e96508-581a-e60c-58cb-37c0c3b3b176@suse.cz>
Date: Thu, 26 Aug 2021 16:07:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSeWymK0elcbiqzt@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 4/4] Add test for CVE 2018-13405
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

On 26. 08. 21 15:27, Petr Vorel wrote:
> Hi Martin,
> 
>> +/*
>> + * Copyright (c) 2021 SUSE LLC <mdoucha@suse.cz>
>> + *
>> + * CVE-2018-13405
>> + *
>> + * Check for possible privilege escalation through creating files with setgid
>> + * bit set inside a setgid directory owned by a group which the user does not
>> + * belong to. Fixed in:
> Maybe this info could be in docparse, but again, that can be fixed during merge.

Yes, please add the docparse tag during merge.

As for if/else braces, I thought the coding style was to add braces
around multi-line statements even if it's a single command.

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
