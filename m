Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F782ABE44
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 15:11:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9738B3C2F7A
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 15:11:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 00D3A3C2F70
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 15:10:56 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1B882600701
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 15:10:49 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6D8E5ADE1
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 14:10:49 +0000 (UTC)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20201109133245.10879-1-mdoucha@suse.cz>
 <20201109135627.GA18105@yuki.lan>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <9d91a462-9aa1-eb1f-6bfc-c2db28967840@suse.cz>
Date: Mon, 9 Nov 2020 15:10:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201109135627.GA18105@yuki.lan>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Add tst_secureboot_enabled() helper function
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

On 09. 11. 20 14:56, Cyril Hrubis wrote:
> Hi!
>> diff --git a/configure.ac b/configure.ac
>> index 03e4e09c9..d9ca5ad38 100644
>> --- a/configure.ac
>> +++ b/configure.ac
>> @@ -296,6 +296,7 @@ LTP_CHECK_CAPABILITY_SUPPORT
>>  LTP_CHECK_CC_WARN_OLDSTYLE
>>  LTP_CHECK_CLONE_SUPPORTS_7_ARGS
>>  LTP_CHECK_CRYPTO
>> +LTP_CHECK_EFIVAR
>>  LTP_CHECK_FORTIFY_SOURCE
>>  LTP_CHECK_KERNEL_DEVEL
>>  LTP_CHECK_KEYUTILS_SUPPORT
>> diff --git a/include/mk/config.mk.in b/include/mk/config.mk.in
>> index 427608a17..cffd11245 100644
>> --- a/include/mk/config.mk.in
>> +++ b/include/mk/config.mk.in
>> @@ -56,8 +56,8 @@ libdir			:= @libdir@
>>  mandir			:= @mandir@
>>  
>>  CPPFLAGS		:= @CPPFLAGS@
>> -CFLAGS			:= @CFLAGS@
>> -LDLIBS			:= @LIBS@
>> +CFLAGS			:= @CFLAGS@ @EFIVAR_CFLAGS@
>> +LDLIBS			:= @LIBS@ @EFIVAR_LIBS@
> 
> Please do not do this.
> 
> This should be handled like any other library, i.e. we should define
> EFIVAR_CFLAGS and EFIVAR_LIBS and use them in respective Makefile.

OK. Could you add some explanation of the policy for library
dependencies to the build system docs later? Thanks.

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
