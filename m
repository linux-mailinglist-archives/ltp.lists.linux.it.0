Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0A2E0FA6
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 03:28:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 599BF3C22D6
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 03:28:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id D159F3C22B0
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 03:27:57 +0200 (CEST)
Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id D368C200DFB
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 03:27:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=0Hz6s
 BS7ikxcdHH3P6gmygC9MknfPau8LiU/JeJFnRs=; b=nx+pVqzbVHeHSfoRMtlSx
 VJlMyvsfP56YHiHSe98CTMSP2p5bHvalzmymaECc0uxsdMqMtWEsQHKDweV6IX8r
 +n1RKD8oKre8rb9Or2DQ6ftsI53mI373E8GjwQiewkoUZcNILuCwMOLdSlb2OoE8
 RVy4snWFIM2fbbwHkbTkgA=
Received: from [192.168.1.133] (unknown [112.25.212.39])
 by smtp12 (Coremail) with SMTP id EMCowADn7h6HrK9d6ysDAA--.7S2;
 Wed, 23 Oct 2019 09:27:36 +0800 (CST)
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
References: <20191022025456.15711-1-ice_yangxiao@163.com>
 <20191022174452.GB4055@calabresa>
From: root <ice_yangxiao@163.com>
Message-ID: <9a14acf0-bdfc-bbc7-680e-6e132124fdd0@163.com>
Date: Wed, 23 Oct 2019 09:27:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191022174452.GB4055@calabresa>
Content-Language: en-US
X-CM-TRANSID: EMCowADn7h6HrK9d6ysDAA--.7S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrWkJryUWFyxtFyUXry8AFb_yoW8ZF4UpF
 W3K3W2k395Ja1DK3s7Wwn0qryjg3yYyr18Gr45Ar4kGwsavFn0qF9Fgw4xur9IgrWj9rW8
 tFWjqFW7X34UArUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07beSdkUUUUU=
X-Originating-IP: [112.25.212.39]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiTBVXXlSIihEcMQAAs6
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fs/binfmt_misc02.sh: Fix local variable
 assignment for dash
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
Cc: limingyu <limingyu@deepin.com>, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 10/23/19 1:44 AM, Thadeu Lima de Souza Cascardo wrote:
> On Tue, Oct 22, 2019 at 10:54:56AM +0800, Xiao Yang wrote:
>> Only the first one can be accepted if more than one string are assigned
>> to local valiable.  For example, only "This" is assigned to $string:
>> ------------------------------------
>> tstring="This is test for extension"
>> ...
>> local string=$tstring
>> ------------------------------------
>>
>> We add a pair of quotes to fix the issue now. Besides we can also fix
>> the issue by splitting declaration and assignment(e.g. local string &
>> string=$tstring).
>>
>> See the explanation from:
>> https://wiki.ubuntu.com/DashAsBinSh#local
>>
>> Fixes: #601
>> Reported-by: limingyu <limingyu@deepin.com>
>> Suggested-by: limingyu <limingyu@deepin.com>
>> Signed-off-by: Xiao Yang <ice_yangxiao@163.com>
> This fixes a problem we have been seeing.
>
> Tested-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>

Hi Thadeu,


Pushed, thanks for your test.


Best Regards,

Xiao Yang

>
>> ---
>>   testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh b/testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh
>> index 8d0ecd895..9dbcd68cc 100755
>> --- a/testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh
>> +++ b/testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh
>> @@ -26,7 +26,7 @@ TST_NEEDS_CMDS="which cat head"
>>   recognised_unrecognised()
>>   {
>>   	local file=$1
>> -	local string=$2
>> +	local string="$2"
>>   
>>   	eval $file >temp 2>&1
>>   	if [ $? -ne 0 ] || ! grep -q "$string" temp; then
>> @@ -52,7 +52,7 @@ recognised_unrecognised()
>>   unrecognised()
>>   {
>>   	local file=$1
>> -	local string=$2
>> +	local string="$2"
>>   
>>   	eval $file >temp 2>&1
>>   	if [ $? -eq 0 ] || grep -q "$string" temp; then
>> -- 
>> 2.21.0
>>
>>
>>
>> -- 
>> Mailing list info: https://lists.linux.it/listinfo/ltp


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
