Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CD9294A5E
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 11:19:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C036C3C31A2
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 11:19:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 71CA33C2481
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 11:19:04 +0200 (CEST)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 562CC1A00CA7
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 11:19:03 +0200 (CEST)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09L99Mhw140115;
 Wed, 21 Oct 2020 09:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : subject : to :
 cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=VsAPaysfGv6pxFYB/8dyieX4vVoFC4eshnOwCLrRBeE=;
 b=bzfW5l2ly/fMHczv78RSpiLSIvaSjf642SoO1v1Oc7er42fUI20xHvuOZIjYVx+vTqwx
 ftzBMP3ZiI0JFC6dLP0dldHgD3/CAQOXdBWVG13zcxVfgtBFqax38g91tBbOLYezMZZF
 mxMpcTwtIvz4fRI1Hf/hYL/NneT4Q4xP2W+V7AFAgIgYOfqwnaR65BUI/JXUGqpUbRrD
 5/+jR6s/Oag48kaNqsWt1KhVlAzj1z/PkCYThvDEpDeMM/YgYzJu4xntk9j7cpN+jcTL
 sZj0jGQ9m2QjcOnQ0BXWYUK3Nvh4OYMpDqnCm7yWsv04IfFdsWDHx3zq9x3ViTsRJV5k jA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 347p4ayk1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 21 Oct 2020 09:19:00 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09L99uLb124228;
 Wed, 21 Oct 2020 09:18:59 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 348acruyb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Oct 2020 09:18:59 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09L9IwIH020877;
 Wed, 21 Oct 2020 09:18:58 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 21 Oct 2020 02:18:58 -0700
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: Petr Vorel <pvorel@suse.cz>
References: <20201015122056.20715-1-alexey.kodanev@oracle.com>
 <20201020135210.GA23197@dell5510>
Message-ID: <eeae2689-153e-3a0b-8bf9-be606683c6d7@oracle.com>
Date: Wed, 21 Oct 2020 12:18:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201020135210.GA23197@dell5510>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9780
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 adultscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010210075
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9780
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501
 clxscore=1015 malwarescore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010210075
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/5] lib/tst_net: add generic tst_netload_compare()
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

On 20.10.2020 16:52, Petr Vorel wrote:
> Hi Alexey,
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
>> * Remove duplicate code for comparing time-based results in
>>   network tests (bbr, busy_poll, sctp, tcp fastopen, virt tests)
> 
>> * Expand thresholds for sctp, bbr test-cases, in order to avoid
>>   false-positive failures.
> I'm ok to keep more changes in single commit, but this change is affecting the
> result, thus maybe put into separate commit?
> (easier if somebody wants to bisect).
> 
Hi Petr,

Sure, will move it to the new one.


>> * In virt_lib.sh, keep sign for VIRT_PERF_THRESHOLD.
> 
>> * TWARN when the base result is too bad (threshold_hi arg is set)
> 
>> Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
>> ---
>>  testcases/lib/tst_net.sh                      | 31 +++++++++++++++++++
>>  testcases/network/busy_poll/busy_poll01.sh    | 10 ++----
>>  testcases/network/busy_poll/busy_poll02.sh    |  8 +----
>>  testcases/network/busy_poll/busy_poll03.sh    |  8 +----
>>  testcases/network/dccp/dccp01.sh              | 15 ++-------
>>  testcases/network/sctp/sctp01.sh              |  8 +----
>>  testcases/network/tcp_cc/bbr01.sh             |  2 +-
>>  testcases/network/tcp_cc/bbr02.sh             |  2 +-
>>  testcases/network/tcp_cc/dctcp01.sh           |  2 +-
>>  testcases/network/tcp_cc/tcp_cc_lib.sh        |  8 +----
>>  .../network/tcp_fastopen/tcp_fastopen_run.sh  | 15 ++-------
>>  testcases/network/virt/virt_lib.sh            | 21 ++-----------
>>  12 files changed, 46 insertions(+), 84 deletions(-)
> 
>> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
>> index d939a5780..b29e076c3 100644
>> --- a/testcases/lib/tst_net.sh
>> +++ b/testcases/lib/tst_net.sh
>> @@ -741,6 +741,37 @@ tst_netload()
>>  	return $ret
>>  }
> 
>> +# Compares results for netload runs.
>> +# tst_netload_compare TIME_BASE TIME THRESHOLD_LOW [THRESHOLD_HI]
>> +# TIME_BASE: time taken to run netstress load test - 100%
>> +# TIME: time that is compared to the base one
>> +# THRESHOD_LOW: lower limit for TFAIL
>> +# THRESHOD_HIGH: upper limit for TWARN
>> +tst_netload_compare()
>> +{
>> +	local base_time=$1
>> +	local new_time=$2
>> +	local threshold_low=$3
>> +	local threshold_hi=$4
>> +
>> +	if [ -z "$base_time" -o -z "$new_time" -o -z "$threshold_low" ]; then
>> +		tst_brk_ TBROK "tst_netload_compare: invalid argument(s)"
>> +	fi
>> +
>> +	local res=$(((base_time - new_time) * 100 / base_time))
>> +	local msg="performance result is ${res}%"
>> +
>> +	if [ "$res" -lt "$threshold_low" ]; then
>> +		tst_res_ TFAIL "$msg < threshold ${threshold_low}%"
>> +		return
>> +	fi
>> +
>> +	[ "$threshold_hi" ] && [ "$res" -gt "$threshold_hi" ] && \
>> +		tst_res_ TWARN "$msg > threshold ${threshold_hi}%"
>> +
>> +	tst_res_ TPASS "$msg, in range [${threshold_low}:${threshold_hi:-}]%"
> 
> Do you mean ${threshold_hi:--} (to print "-" when $threshold_hi not set?)
> As ${threshold_hi:-} prints empty string when unset (equivalent of ${threshold_hi}).
> 
> 

Yes, it's not really needed anymore. At some point I tried
to use different placeholders, a white-space etc... but it
fine as it is now, so will change to a simpler form.


>> +}
> 
> ...
> 
> Kind regards,
> Petr
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
