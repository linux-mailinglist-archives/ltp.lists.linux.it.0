Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6802F6249
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 14:46:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A1833C5823
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 14:46:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 3DE0C3C319F
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 14:46:31 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E27D2600758
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 14:46:30 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3CE58ACB0
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 13:46:30 +0000 (UTC)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210112095759.11910-1-mdoucha@suse.cz>
 <20210112095759.11910-2-mdoucha@suse.cz> <YABJTK2hRHBjJ6lc@yuki.lan>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <ef29118b-436a-5d2f-1bde-2a5b3ac78290@suse.cz>
Date: Thu, 14 Jan 2021 14:46:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <YABJTK2hRHBjJ6lc@yuki.lan>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.2 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 2/3] Add tst_secureboot_enabled() helper
 function
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

On 14. 01. 21 14:38, Cyril Hrubis wrote:
> Hi!
>> +int tst_secureboot_enabled(void)
>> +{
>> +	int fd;
>> +	char data[5];
>> +
>> +	if (access(EFIVAR_SECUREBOOT, F_OK)) {
>> +		tst_res(TINFO, "Efivar FS not available");
>> +		return -1;
>> +	}
>> +
>> +	fd = open(EFIVAR_SECUREBOOT, O_RDONLY);
>> +
>> +	if (fd == -1) {
>> +		tst_res(TINFO | TERRNO,
>> +			"Cannot open SecureBoot Efivar sysfile");
>> +		return -1;
>> +	} else if (fd < 0) {
>> +		tst_brk(TBROK | TERRNO, "Invalid open() return value %d", fd);
>> +		return -1;
>> +	}
> 
> If we change the access() above to R_OK we can just do SAFE_OPEN() here, right?
> 
> Other than this the code looks good.

We could change it, but I'd prefer to know that the Efivar FS exists but
cannnot be open()ed due to missing permissions than to mix these two
states into the same vague info message.

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
