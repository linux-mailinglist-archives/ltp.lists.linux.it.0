Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6A123CAAE
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 14:47:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E214A3C325C
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 14:47:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 480BE3C14BD
 for <ltp@lists.linux.it>; Fri, 31 Jul 2020 23:31:27 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 7DD2320136E
 for <ltp@lists.linux.it>; Fri, 31 Jul 2020 23:31:26 +0200 (CEST)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 4A3CB20B4908;
 Fri, 31 Jul 2020 14:31:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4A3CB20B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1596231084;
 bh=S4cTyhHoE+e/ZUW8inxxRdk7qNFQf+4rRLYkoIY0bi0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XWFKsrXff+XTGjLVr0uyHzTS4nxNB+vGdgDR0Le89hWAKGSMsXDUzUyeeakkeA0WE
 3gFxaJtt6+MrdgBMhwAgHdGk5VTCa8eGweHT8CEp/6oljeLIUEsJvMDAACH996G+aj
 lEEkjnlSEyvAuyv7J89ZJB1TUzCgXTHefgzomK8c=
To: Petr Vorel <pvorel@suse.cz>, Lachlan Sneff <t-josne@linux.microsoft.com>
References: <20200717205721.18173-1-t-josne@linux.microsoft.com>
 <20200731080221.GA14041@dell5510>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <edf26ac1-6378-c632-9e91-5c09141639af@linux.microsoft.com>
Date: Fri, 31 Jul 2020 14:31:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731080221.GA14041@dell5510>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-15.6 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 05 Aug 2020 14:47:31 +0200
Subject: Re: [LTP] [PATCH] IMA: Add a test to verify importing a certificate
 into custom keyring
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
Cc: linux-integrity@vger.kernel.org, ltp@lists.linux.it,
 balajib@linux.microsoft.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 7/31/20 1:02 AM, Petr Vorel wrote:

Hi Petr,

>> A test for verifying importing an x509 certificate into a keyring and
>> validating the key measurement performed by IMA is needed.
> 
> I suppose you're going to send new version of this patch (rebased + fix
> according to Mimi's comments).
> 
> IMHO that should be your last not yet merged patch.
> 
> FYI: I'm planning to fix ima_tpm.sh and then implement autoloading IMA policy
> (when possible).
> 

Yes - Lachlan will send the new version of the patch set (rebased to 
your latest changes and also addressing Mimi's comments).

thanks,
  -lakshmi


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
