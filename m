Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0F122152B
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 21:34:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 216953C2AB0
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 21:34:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 201863C22AD
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 21:34:14 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 3DF821A006E5
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 21:34:13 +0200 (CEST)
Received: from [192.168.1.21] (c-73-187-218-229.hsd1.pa.comcast.net
 [73.187.218.229])
 by linux.microsoft.com (Postfix) with ESMTPSA id 9CD1E20B4908;
 Wed, 15 Jul 2020 12:34:11 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9CD1E20B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1594841652;
 bh=IglEbAJU+UyvchllfhMd0WugLDkSaTATtm5tCbv4SQs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XBUnSC+tn9e7wIJ0q7L7CHcqZPo0ryGEZo+t3C5Q6Z04WyH/fxkUeQXf6CHAbWdDy
 4jdhNyrl+1RKwvlb6w/DpTGPtYNWQ/tQfY0sweHs7g+1+PBDgAXBieTBtxkNEB5Eio
 b6kITWk2e5SHGdbwy6QuO90rfOJ4TmgNjcyteUvg=
To: Mimi Zohar <zohar@linux.ibm.com>, pvorel@suse.cz,
 nramas@linux.microsoft.com, ltp@lists.linux.it
References: <20200626021126.56760-1-t-josne@linux.microsoft.com>
 <20200626021126.56760-2-t-josne@linux.microsoft.com>
 <1594773355.12900.210.camel@linux.ibm.com>
From: Lachlan Sneff <t-josne@linux.microsoft.com>
Message-ID: <7d8ac937-00d6-3cc1-7d38-3417580512d9@linux.microsoft.com>
Date: Wed, 15 Jul 2020 15:34:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1594773355.12900.210.camel@linux.ibm.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/2] IMA: Add a test to verify measurment of
 keys
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
Cc: balajib@linux.microsoft.com, linux-integrity@vger.kernel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 7/14/20 8:35 PM, Mimi Zohar wrote:
> An additional test might be to verify that only the keys in the
> measurement list are actually on the specified keyring and nothing
> else.
That seems like a good idea. I may not have time to implement it however.
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
- Lachlan

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
