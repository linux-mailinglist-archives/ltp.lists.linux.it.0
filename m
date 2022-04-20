Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E23ED508508
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Apr 2022 11:33:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 00D253CA6CF
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Apr 2022 11:33:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 87D453CA692
 for <ltp@lists.linux.it>; Wed, 20 Apr 2022 11:33:09 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4FA46680E41
 for <ltp@lists.linux.it>; Wed, 20 Apr 2022 11:33:05 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 852361F380;
 Wed, 20 Apr 2022 09:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1650447185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lB8XuXSerjPSQxCPmbz4LdSUl2SmFBfK4c88YZMJlAI=;
 b=nxO7fzYMI8RdcXI/Jnf/Phkrp346yh1aO//krpH/sfpmF05DQcxrBxpyPaABqNJkxAfyRQ
 jq8v5Ji0zvsl4VbXcd/wAx6tVi2B4iGaonynSmkYqPO4fZsV0JC+4G9FICfif1rUcDu/61
 LlqEN86iEF/NAglGHVQ5MHHHAI2Z9wo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1650447185;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lB8XuXSerjPSQxCPmbz4LdSUl2SmFBfK4c88YZMJlAI=;
 b=pvw035zvWSuMY0Lsghbr3E3aCO1vNbH/UFLoKlF1Yv8qHUJopvF7W4VZF9rIjzsl3w5+HK
 /T2yCey0nYEEMJCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 73B3E13A30;
 Wed, 20 Apr 2022 09:33:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id w1EQG1HTX2I9FAAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Wed, 20 Apr 2022 09:33:05 +0000
Message-ID: <1148ebad-dce6-dbcb-63e5-db7131f914b9@suse.cz>
Date: Wed, 20 Apr 2022 11:33:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Cyril Hrubis <chrubis@suse.cz>
References: <20220331113324.14742-1-mdoucha@suse.cz>
 <20220331113324.14742-3-mdoucha@suse.cz> <Ylf2hd82r1pLFlbd@yuki>
 <a4feb22e-d4f8-00dd-5970-0832dc90ddfa@suse.cz> <Yl/OO5mBXW5h1e91@yuki>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <Yl/OO5mBXW5h1e91@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-3.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/3] KVM test infrastructure
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

On 20. 04. 22 11:11, Cyril Hrubis wrote:
>> I didn't #include the tst_res_flags.h because the main LTP include
>> directory is not passed to the preprocessor when compiling KVM payload.
>> I'd have to do it like this:
>> #include "../../../../include/tst_res_flags.h"
> 
> And I guess that this is on purpose right?
> 
> As we can easily add it by adding -I$(top_src_dir)/include/ to the
> CFLAGS.

Yes, this is on purpose. I want any #include of standard LTP headers to
trigger error because the vast majority of the functions declared in
there are not available in KVM guest library. So should I add the dirty
#include or should I keep the duplicate definition of tst_res flags?

>> I guess that copying LTP_ALIGN() to the KVM headers would be useful.
> 
> Can you please respin the patchset with this change then?

Yes, as soon as we agree on the #includes above.

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
