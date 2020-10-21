Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E13EB294AE3
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 11:56:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 77B103C319D
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 11:56:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 0F7AA3C253A
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 11:56:36 +0200 (CEST)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 546096008FD
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 11:56:36 +0200 (CEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09L9jUwi008061;
 Wed, 21 Oct 2020 09:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=sTwDfIWMuZ9dHuBLMsiU65oDT07rsrOb5iw2Hrc6d18=;
 b=AyKnCq/+6e7sIZJCruJSzHXkJHQvTPbXrel6kUynh05BH80dbXOFTqB5dmryXgezF+2H
 NUpanVdkeZHZ/x3qoaZ9FjYWVVhLrvI5viBqqIBun47+AWIY/SLQA0VWOsdBzgBXE++o
 JqHAHG3p4zAEaZOEOv7TJbBgO/rIV3m6aIs/7eD1x1Zo4rsVAwqUHLTGDtf9u+NKc/Mn
 geaOXeJchq+3nBwd+9OYUjD3hQ5j702wSd6yJ457pg1tu37KlMS1mMoq5U684qbPKVZ5
 mWn+smLMFUT/mvvdhl1RNtjdc2iiGSsKlDNizMMhLZQnMicuJezF+Y7VCwXi4iSMS0RT fw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 349jrpqq47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 21 Oct 2020 09:56:34 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09L9k5lK132928;
 Wed, 21 Oct 2020 09:56:34 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 348a6p87mm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Oct 2020 09:56:34 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09L9uXTJ011015;
 Wed, 21 Oct 2020 09:56:33 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 21 Oct 2020 02:56:32 -0700
To: Petr Vorel <pvorel@suse.cz>
References: <20201015122056.20715-1-alexey.kodanev@oracle.com>
 <20201015122056.20715-2-alexey.kodanev@oracle.com>
 <20201020143940.GB23197@dell5510>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <711809cc-28c3-a51d-72a2-6d3f64db0a1c@oracle.com>
Date: Wed, 21 Oct 2020 12:56:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201020143940.GB23197@dell5510>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9780
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010210077
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9780
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010210077
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/5] lib/tst_net: calc mean in tst_netload()
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

On 20.10.2020 17:39, Petr Vorel wrote:
>> Add TST_NETLOAD_RUN_COUNT to control how many times netstress
>> test will be run to calculate the mean time value. Default is 5.
> 
>> This value will divide the total number of requests in order
>> not to significantly increase the time for the test after this
>> patch.
> 
>> Moreover, one of the runs can fail once, it will produce only a
>> warning. The test will broke after the second failure. It can
>> be useful to make sure we have reproducible results.
> 
>> Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
>> ---
>>  testcases/lib/tst_net.sh | 95 ++++++++++++++++++++++++++--------------
>>  1 file changed, 62 insertions(+), 33 deletions(-)
> 
>> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
>> index b29e076c3..1912b984d 100644
>> --- a/testcases/lib/tst_net.sh
>> +++ b/testcases/lib/tst_net.sh
>> @@ -623,9 +623,11 @@ tst_wait_ipv6_dad()
>>  	done
>>  }
> 
>> -tst_dump_rhost_cmd()
>> +tst_netload_brk()
>>  {
>>  	tst_rhost_run -c "cat $TST_TMPDIR/netstress.log"
>> +	cat tst_netload.log
>> +	tst_brk_ $1 $2
>>  }
> 
>>  # Run network load test, see 'netstress -h' for option description
>> @@ -640,6 +642,7 @@ tst_netload()
>>  	# common options for client and server
>>  	local cs_opts=
> 
>> +	local run_cnt="$TST_NETLOAD_RUN_COUNT"
>>  	local c_num="$TST_NETLOAD_CLN_NUMBER"
>>  	local c_requests="$TST_NETLOAD_CLN_REQUESTS"
>>  	local c_opts=
>> @@ -692,51 +695,76 @@ tst_netload()
>>  	local expect_ret=0
>>  	[ "$expect_res" != "pass" ] && expect_ret=3
> 
>> -	tst_rhost_run -c "pkill -9 netstress\$"
>> -	s_opts="${cs_opts}${s_opts}-R $s_replies -B $TST_TMPDIR"
>> -	tst_res_ TINFO "run server 'netstress $s_opts'"
>> -	tst_rhost_run -c "netstress $s_opts" > tst_netload.log 2>&1
>> -	if [ $? -ne 0 ]; then
>> -		cat tst_netload.log
>> -		local ttype="TFAIL"
>> -		grep -e 'CONF:' tst_netload.log && ttype="TCONF"
>> -		tst_brk_ $ttype "server failed"
>> +	local was_failure=0
> nit: I prefer have local variables at the top and boolean like variables as empty vs.
> "1" (tested with [ "$foo" = 1 ] (see: if [ "$bind_to_device" = 1 -a "$TST_NETLOAD_BINDTODEVICE" = 1 ]; then
> few lines above).
> 
> This style is used in tst_test.sh, which is consistent, but style in tst_net.sh
> varies on this a lot. It's just a style and it wasn't introduced before this
> commit, thus feel free to ignore it, but it'd be nice to be consistent in
> library file.
> 
>> +	if [ "$run_cnt" -lt 2 ]; then
> maybe: if [ "$run_cnt" -lt 1 ]; then
> 
> BTW we should also check all numeric variables (TST_NETLOAD_CLN_REQUESTS, ...)
> with tst_is_int (but don't bother with it now).
> 
>> +		run_cnt=1
>> +		was_failure=1
> Hm, $was_failure set before loop. Shouldn't it be inside for i in $(seq 1
> $run_cnt); do loop? And updated on each failure (be a error counter, not boolean)?


It is set to 1 for the special case, i.e. when run_cnt is 1, in that case
we should tbrok the test at once. I don't see how the error counter will be
better?

>>  	fi
> 
>> -	local port=$(tst_rhost_run -s -c "cat $TST_TMPDIR/netstress_port")
>> -	c_opts="${cs_opts}${c_opts}-a $c_num -r $c_requests -d $rfile -g $port"
>> +	s_opts="${cs_opts}${s_opts}-R $s_replies -B $TST_TMPDIR"
>> +	c_opts="${cs_opts}${c_opts}-a $c_num -r $((c_requests / run_cnt)) -d $rfile"
>> +
>> +	tst_res_ TINFO "run server 'netstress $s_opts'"
>> +	tst_res_ TINFO "run client 'netstress -l $c_opts' $run_cnt times"
> 
>> -	tst_res_ TINFO "run client 'netstress -l $c_opts'"
>> -	netstress -l $c_opts > tst_netload.log 2>&1 || ret=$?
>>  	tst_rhost_run -c "pkill -9 netstress\$"
>> +	rm -f tst_netload.log
>> +
>> +	local res=0
>> +	local passed=0
>> +
>> +	for i in $(seq 1 $run_cnt); do
>> +		tst_rhost_run -c "netstress $s_opts" > tst_netload.log 2>&1
>> +		if [ $? -ne 0 ]; then
>> +			cat tst_netload.log
>> +			local ttype="TFAIL"
>> +			grep -e 'CONF:' tst_netload.log && ttype="TCONF"
>> +			tst_brk_ $ttype "server failed"
>> +		fi
> 
>> -	if [ "$expect_ret" -ne 0 ]; then
>> -		if [ $((ret & expect_ret)) -ne 0 ]; then
>> -			tst_res_ TPASS "netstress failed as expected"
>> -		else
>> -			tst_res_ TFAIL "expected '$expect_res' but ret: '$ret'"
>> +		local port=$(tst_rhost_run -s -c "cat $TST_TMPDIR/netstress_port")
>> +		netstress -l ${c_opts} -g $port > tst_netload.log 2>&1
>> +		ret=$?
>> +		tst_rhost_run -c "pkill -9 netstress\$"
>> +
>> +		if [ "$expect_ret" -ne 0 ]; then
>> +			if [ $((ret & expect_ret)) -ne 0 ]; then
>> +				tst_res_ TPASS "netstress failed as expected"
>> +			else
>> +				tst_res_ TFAIL "expected '$expect_res' but ret: '$ret'"
>> +			fi
>> +			return $ret
>> +		fi
>> +
>> +		if [ "$ret" -ne 0 ]; then
>> +			[ $((ret & 32)) -ne 0 ] && \
>> +				tst_netload_brk TCONF "not supported configuration"
>> +
>> +			[ $((ret & 3)) -ne 0 -a $was_failure -gt 0 ] && \
>> +				tst_netload_brk TFAIL "expected '$expect_res' but ret: '$ret'"
> Instead the 2 lines above maybe this? Or am I missing something?
> 
> 			if [ $((ret & 3)) -ne 0 ]; then
> 				was_failure=$((was_failure+1))
> 			fi
> 			[ $was_failure -gt 0 ] && \
> 				tst_netload_brk TFAIL "expected '$expect_res' but ret: '$ret'"

With this, it should exit on the first error, as it was before this patch...

And I'm expecting to do this only on the second one, if run_cnt >= 2.


>> +
>> +			tst_res_ TWARN "netstress failed, ret: $ret"
>> +			was_failure=1
>> +			continue
>>  		fi
>> -		return $ret
>> -	fi
> ...
> 
> Kind regards,
> Petr
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
